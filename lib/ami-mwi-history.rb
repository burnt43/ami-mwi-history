require 'set'
require 'stringio'

module AmiMwiHistory
  module AmiMessage
    EVENT_NAMES_TO_PROCESS = Set.new(%w[
      MessageWaiting
      VoicemailUserEntry
    ])

    def process_for_ami_mwi_history?
      EVENT_NAMES_TO_PROCESS.member?(event_name_for_ami_mwi_history)
    end

    def debug_for_ami_mwi_history
      return unless process_for_ami_mwi_history?

      StringIO.new.tap do |s|
        %i[
          event_name_for_ami_mwi_history
          mailbox_name_for_ami_mwi_history
          waiting_for_ami_mwi_history
          new_for_ami_mwi_history
          old_for_ami_mwi_history
        ].each do |method_name|
          s.printf("%-30s: %s\n", method_name, send(method_name))
        end
      end.string
    end

    def event_name_for_ami_mwi_history
      raise 'Implement in Class!'
    end

    def mailbox_name_for_ami_mwi_history
      raise 'Implement in Class!'
    end

    def waiting_for_ami_mwi_history
      raise 'Implement in Class!'
    end

    def new_for_ami_mwi_history
      raise 'Implement in Class!'
    end

    def old_for_ami_mwi_history
      raise 'Implement in Class!'
    end
  end

  module Processor
    class << self
      def handle_ami_message(ami_message)
        if ami_message.process_for_ami_mwi_history?
          message_waiting_changed?(ami_message).tap do |result|
            update_mailbox_attributes(
              ami_message.mailbox_name_for_ami_mwi_history,
              waiting: ami_message.waiting_for_ami_mwi_history,
              new: ami_message.new_for_ami_mwi_history,
              old: ami_message.old_for_ami_mwi_history
            )
          end
        else
          true
        end
      end

      def clear_mailbox_attributes!
        (@mailbox_attributes ||= {}).clear
      end

      private

      def mutex
        @mutex ||= Mutex.new
      end

      def existing_data_for_ami_message(ami_message)
        return unless @mailbox_attributes

        @mailbox_attributes[ami_message.mailbox_name_for_ami_mwi_history]
      end

      def update_mailbox_attributes(
        mailbox_name,
        waiting: nil,
        new: nil,
        old: nil
      )
        mutex.synchronize do
          # Store the values as is. Do not convert to integer. This is wasted
          # time and we want the equality checks to be fast so we don't bog
          # down the processing. All parsed messages off the ami socket should
          # be strings so we shouldn't run into an issue with comparing strings
          # and integers causing confusion.
          (@mailbox_attributes ||= {})[mailbox_name] = {
            waiting:       waiting,
            new:           new,
            old:           old,
            last_received: Time.now
          }
        end
      end

      def message_waiting_changed?(ami_message)
        # Lookup the last received MessageWaiting
        existing_data = existing_data_for_ami_message(ami_message)

        # If there is no last received MessageWaiting, then we consider this
        # ami_message changed from last time, because there was no last time.
        return true unless existing_data

        # Check if any of the mailbox data is different from last time
        # we received a MessageWaiting.
        # NOTE: We also store the last_received in 'existing_data', so if
        #   in the future if the data is older than a certain time, maybe
        #   we can consider this too old to be trusted, but we don't need
        #   that right now.
        %i[waiting new old].any? do |attr_name|
          !existing_data[attr_name].nil? &&
          existing_data[attr_name] != ami_message.send("#{attr_name}_for_ami_mwi_history")
        end
      end
    end
  end
end

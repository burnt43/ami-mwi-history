require './lib/ami-mwi-history'

require 'minitest/pride'
require 'minitest/autorun'

module AmiMwiHistory
  module Testing
    class Test < ::Minitest::Test
      def setup
        AmiMwiHistory::Processor.clear_mailbox_attributes!
      end
    end

    FakeMessageWaiting = Struct.new(
      :mailbox_name_for_ami_mwi_history,
      :waiting_for_ami_mwi_history,
      :new_for_ami_mwi_history,
      :old_for_ami_mwi_history
    ) do
      include AmiMwiHistory::AmiMessage

      def event_name_for_ami_mwi_history
        'MessageWaiting'
      end
    end

    FakeVoicemailUserEntry = Struct.new(
      :mailbox_name_for_ami_mwi_history,
      :new_for_ami_mwi_history,
      :old_for_ami_mwi_history
    ) do
      include AmiMwiHistory::AmiMessage

      def event_name_for_ami_mwi_history
        'VoicemailUserEntry'
      end

      def waiting_for_ami_mwi_history
        nil
      end
    end

    FakeGenericMessage = Struct.new(
      :foo
    ) do
      include AmiMwiHistory::AmiMessage

      def event_name_for_ami_mwi_history
        'GenericMessage'
      end
    end
  end
end

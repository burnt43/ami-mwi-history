require './test/initialize'

module AmiMwiHistory
  module Testing
    class ProcessorTest < AmiMwiHistory::Testing::Test
      def test_handle_ami_message_with_generic_message
        fake_generic_message_01 = AmiMwiHistory::Testing::FakeGenericMessage.new(0)

        assert(AmiMwiHistory::Processor.handle_ami_message(fake_generic_message_01))
        assert(AmiMwiHistory::Processor.handle_ami_message(fake_generic_message_01))
      end

      def test_handle_ami_message_with_voicemail_user_entry
        fake_voicemail_user_entry_100_01 = AmiMwiHistory::Testing::FakeVoicemailUserEntry.new(
          '100@foobar', *([0, 0].map(&:to_s))
        )
        fake_voicemail_user_entry_100_02 = AmiMwiHistory::Testing::FakeVoicemailUserEntry.new(
          '100@foobar', *([0, 1].map(&:to_s))
        )
        fake_voicemail_user_entry_100_03 = AmiMwiHistory::Testing::FakeVoicemailUserEntry.new(
          '100@foobar', *([0, 2].map(&:to_s))
        )
        fake_voicemail_user_entry_100_04 = AmiMwiHistory::Testing::FakeVoicemailUserEntry.new(
          '100@foobar', *([1, 2].map(&:to_s))
        )
        fake_voicemail_user_entry_100_05 = AmiMwiHistory::Testing::FakeVoicemailUserEntry.new(
          '100@foobar', *([2, 2].map(&:to_s))
        )
        fake_voicemail_user_entry_100_06 = AmiMwiHistory::Testing::FakeVoicemailUserEntry.new(
          '100@foobar', *([2, 1].map(&:to_s))
        )
        fake_voicemail_user_entry_100_07 = AmiMwiHistory::Testing::FakeVoicemailUserEntry.new(
          '100@foobar', *([2, 0].map(&:to_s))
        )
        fake_voicemail_user_entry_100_08 = AmiMwiHistory::Testing::FakeVoicemailUserEntry.new(
          '100@foobar', *([1, 0].map(&:to_s))
        )

        assert(AmiMwiHistory::Processor.handle_ami_message(fake_voicemail_user_entry_100_01))
        refute(AmiMwiHistory::Processor.handle_ami_message(fake_voicemail_user_entry_100_01))

        assert(AmiMwiHistory::Processor.handle_ami_message(fake_voicemail_user_entry_100_02))
        refute(AmiMwiHistory::Processor.handle_ami_message(fake_voicemail_user_entry_100_02))

        assert(AmiMwiHistory::Processor.handle_ami_message(fake_voicemail_user_entry_100_03))
        refute(AmiMwiHistory::Processor.handle_ami_message(fake_voicemail_user_entry_100_03))

        assert(AmiMwiHistory::Processor.handle_ami_message(fake_voicemail_user_entry_100_04))
        refute(AmiMwiHistory::Processor.handle_ami_message(fake_voicemail_user_entry_100_04))

        assert(AmiMwiHistory::Processor.handle_ami_message(fake_voicemail_user_entry_100_05))
        refute(AmiMwiHistory::Processor.handle_ami_message(fake_voicemail_user_entry_100_05))

        assert(AmiMwiHistory::Processor.handle_ami_message(fake_voicemail_user_entry_100_06))
        refute(AmiMwiHistory::Processor.handle_ami_message(fake_voicemail_user_entry_100_06))

        assert(AmiMwiHistory::Processor.handle_ami_message(fake_voicemail_user_entry_100_07))
        refute(AmiMwiHistory::Processor.handle_ami_message(fake_voicemail_user_entry_100_07))

        assert(AmiMwiHistory::Processor.handle_ami_message(fake_voicemail_user_entry_100_08))
        refute(AmiMwiHistory::Processor.handle_ami_message(fake_voicemail_user_entry_100_08))
      end

      def test_handle_ami_message_with_message_waiting
        fake_message_waiting_100_01 = AmiMwiHistory::Testing::FakeMessageWaiting.new(
          '100@foobar', *([0, 0, 0].map(&:to_s))
        )

        fake_message_waiting_100_02 = AmiMwiHistory::Testing::FakeMessageWaiting.new(
          '100@foobar', *([0, 0, 1].map(&:to_s))
        )
        fake_message_waiting_100_12 = AmiMwiHistory::Testing::FakeMessageWaiting.new(
          '100@foobar', *([0, 0, 2].map(&:to_s))
        )

        fake_message_waiting_100_03 = AmiMwiHistory::Testing::FakeMessageWaiting.new(
          '100@foobar', *([0, 1, 0].map(&:to_s))
        )
        fake_message_waiting_100_13 = AmiMwiHistory::Testing::FakeMessageWaiting.new(
          '100@foobar', *([0, 2, 0].map(&:to_s))
        )

        fake_message_waiting_100_04 = AmiMwiHistory::Testing::FakeMessageWaiting.new(
          '100@foobar', *([0, 1, 1].map(&:to_s))
        )
        fake_message_waiting_100_14 = AmiMwiHistory::Testing::FakeMessageWaiting.new(
          '100@foobar', *([0, 2, 2].map(&:to_s))
        )

        fake_message_waiting_100_05 = AmiMwiHistory::Testing::FakeMessageWaiting.new(
          '100@foobar', *([1, 0, 0].map(&:to_s))
        )
        fake_message_waiting_100_15 = AmiMwiHistory::Testing::FakeMessageWaiting.new(
          '100@foobar', *([2, 0, 0].map(&:to_s))
        )

        fake_message_waiting_100_06 = AmiMwiHistory::Testing::FakeMessageWaiting.new(
          '100@foobar', *([1, 0, 1].map(&:to_s))
        )
        fake_message_waiting_100_16 = AmiMwiHistory::Testing::FakeMessageWaiting.new(
          '100@foobar', *([2, 0, 2].map(&:to_s))
        )

        fake_message_waiting_100_07 = AmiMwiHistory::Testing::FakeMessageWaiting.new(
          '100@foobar', *([1, 1, 0].map(&:to_s))
        )
        fake_message_waiting_100_17 = AmiMwiHistory::Testing::FakeMessageWaiting.new(
          '100@foobar', *([2, 2, 0].map(&:to_s))
        )

        fake_message_waiting_100_08 = AmiMwiHistory::Testing::FakeMessageWaiting.new(
          '100@foobar', *([1, 1, 1].map(&:to_s))
        )
        fake_message_waiting_100_18 = AmiMwiHistory::Testing::FakeMessageWaiting.new(
          '100@foobar', *([2, 2, 2].map(&:to_s))
        )

        fake_message_waiting_101_01 = AmiMwiHistory::Testing::FakeMessageWaiting.new(
          '101@foobar', *([0, 0, 0].map(&:to_s))
        )

        assert(AmiMwiHistory::Processor.handle_ami_message(fake_message_waiting_100_01))
        refute(AmiMwiHistory::Processor.handle_ami_message(fake_message_waiting_100_01))

        assert(AmiMwiHistory::Processor.handle_ami_message(fake_message_waiting_100_02))
        refute(AmiMwiHistory::Processor.handle_ami_message(fake_message_waiting_100_02))
        assert(AmiMwiHistory::Processor.handle_ami_message(fake_message_waiting_100_12))
        refute(AmiMwiHistory::Processor.handle_ami_message(fake_message_waiting_100_12))

        assert(AmiMwiHistory::Processor.handle_ami_message(fake_message_waiting_100_03))
        refute(AmiMwiHistory::Processor.handle_ami_message(fake_message_waiting_100_03))
        assert(AmiMwiHistory::Processor.handle_ami_message(fake_message_waiting_100_13))
        refute(AmiMwiHistory::Processor.handle_ami_message(fake_message_waiting_100_13))

        assert(AmiMwiHistory::Processor.handle_ami_message(fake_message_waiting_100_04))
        refute(AmiMwiHistory::Processor.handle_ami_message(fake_message_waiting_100_04))
        assert(AmiMwiHistory::Processor.handle_ami_message(fake_message_waiting_100_14))
        refute(AmiMwiHistory::Processor.handle_ami_message(fake_message_waiting_100_14))

        assert(AmiMwiHistory::Processor.handle_ami_message(fake_message_waiting_100_05))
        refute(AmiMwiHistory::Processor.handle_ami_message(fake_message_waiting_100_05))
        assert(AmiMwiHistory::Processor.handle_ami_message(fake_message_waiting_100_15))
        refute(AmiMwiHistory::Processor.handle_ami_message(fake_message_waiting_100_15))

        assert(AmiMwiHistory::Processor.handle_ami_message(fake_message_waiting_100_06))
        refute(AmiMwiHistory::Processor.handle_ami_message(fake_message_waiting_100_06))
        assert(AmiMwiHistory::Processor.handle_ami_message(fake_message_waiting_100_16))
        refute(AmiMwiHistory::Processor.handle_ami_message(fake_message_waiting_100_16))

        assert(AmiMwiHistory::Processor.handle_ami_message(fake_message_waiting_100_07))
        refute(AmiMwiHistory::Processor.handle_ami_message(fake_message_waiting_100_07))
        assert(AmiMwiHistory::Processor.handle_ami_message(fake_message_waiting_100_17))
        refute(AmiMwiHistory::Processor.handle_ami_message(fake_message_waiting_100_17))

        assert(AmiMwiHistory::Processor.handle_ami_message(fake_message_waiting_100_08))
        refute(AmiMwiHistory::Processor.handle_ami_message(fake_message_waiting_100_08))
        assert(AmiMwiHistory::Processor.handle_ami_message(fake_message_waiting_100_18))
        refute(AmiMwiHistory::Processor.handle_ami_message(fake_message_waiting_100_18))
        assert(AmiMwiHistory::Processor.handle_ami_message(fake_message_waiting_100_08))
        refute(AmiMwiHistory::Processor.handle_ami_message(fake_message_waiting_100_08))

        assert(AmiMwiHistory::Processor.handle_ami_message(fake_message_waiting_100_17))
        refute(AmiMwiHistory::Processor.handle_ami_message(fake_message_waiting_100_17))
        assert(AmiMwiHistory::Processor.handle_ami_message(fake_message_waiting_100_07))
        refute(AmiMwiHistory::Processor.handle_ami_message(fake_message_waiting_100_07))

        assert(AmiMwiHistory::Processor.handle_ami_message(fake_message_waiting_100_16))
        refute(AmiMwiHistory::Processor.handle_ami_message(fake_message_waiting_100_16))
        assert(AmiMwiHistory::Processor.handle_ami_message(fake_message_waiting_100_06))
        refute(AmiMwiHistory::Processor.handle_ami_message(fake_message_waiting_100_06))

        assert(AmiMwiHistory::Processor.handle_ami_message(fake_message_waiting_100_15))
        refute(AmiMwiHistory::Processor.handle_ami_message(fake_message_waiting_100_15))
        assert(AmiMwiHistory::Processor.handle_ami_message(fake_message_waiting_100_05))
        refute(AmiMwiHistory::Processor.handle_ami_message(fake_message_waiting_100_05))

        assert(AmiMwiHistory::Processor.handle_ami_message(fake_message_waiting_100_14))
        refute(AmiMwiHistory::Processor.handle_ami_message(fake_message_waiting_100_14))
        assert(AmiMwiHistory::Processor.handle_ami_message(fake_message_waiting_100_04))
        refute(AmiMwiHistory::Processor.handle_ami_message(fake_message_waiting_100_04))

        assert(AmiMwiHistory::Processor.handle_ami_message(fake_message_waiting_100_13))
        refute(AmiMwiHistory::Processor.handle_ami_message(fake_message_waiting_100_13))
        assert(AmiMwiHistory::Processor.handle_ami_message(fake_message_waiting_100_03))
        refute(AmiMwiHistory::Processor.handle_ami_message(fake_message_waiting_100_03))

        assert(AmiMwiHistory::Processor.handle_ami_message(fake_message_waiting_100_12))
        refute(AmiMwiHistory::Processor.handle_ami_message(fake_message_waiting_100_12))
        assert(AmiMwiHistory::Processor.handle_ami_message(fake_message_waiting_100_02))
        refute(AmiMwiHistory::Processor.handle_ami_message(fake_message_waiting_100_02))

        assert(AmiMwiHistory::Processor.handle_ami_message(fake_message_waiting_100_01))
        refute(AmiMwiHistory::Processor.handle_ami_message(fake_message_waiting_100_01))

        assert(AmiMwiHistory::Processor.handle_ami_message(fake_message_waiting_101_01))
        refute(AmiMwiHistory::Processor.handle_ami_message(fake_message_waiting_101_01))
      end
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TestsMailer, type: :mailer do
  describe 'notifications' do
    it 'notifies the user after test completion' do
      user = create(:user)
      test = create(:test)
      test_passage = create(:test_passage, user:, test:)
      email = TestsMailer.completed_test(test_passage)

      assert_emails 1 do
        email.deliver_now
      end
      assert_equal email.to, [user.email]
      assert_equal email.from, ['mail@testguru.com']
    end
  end
end

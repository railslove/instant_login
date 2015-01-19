require 'rails_helper'

RSpec.describe InstantLogin::User, :type => :model do
  describe '#deliver_token' do
    it 'sends an email via the default mailer' do
      user = InstantLogin::User.new email: 'test@test.org', instant_login_token: '123456'
      user.deliver_token
      mail = ActionMailer::Base.deliveries.first
      expect(mail.body.raw_source).to include('Your instant login link:')
    end

    context 'with custom configuration' do
      before do
        InstantLogin.config.mailer = 'CustomMailer'
        InstantLogin.config.mailer_action = 'custom_token'
      end

      it 'sends email via custom mailer if configured' do
        user = InstantLogin::User.new email: 'test@test.org', instant_login_token: '123456'
        user.deliver_token
        mail = ActionMailer::Base.deliveries.first
        expect(mail.body.raw_source).to include('Hello you there')
      end
    end
  end
end

class InstantLogin::User < ActiveRecord::Base
  self.table_name = InstantLogin.config.user_table

  scope :valid_tokens, -> { where('instant_login_token_created_at >= ?', 15.minutes.ago) }

  def generate_and_deliver_token
    generate_instant_login_token
    deliver_token
  end

  def generate_instant_login_token
    update(instant_login_token: SecureRandom.uuid, instant_login_token_created_at: Time.now)
  end

  def deliver_token
    mailer = Object.const_get(InstantLogin.config.mailer)
    mailer.send(InstantLogin.config.mailer_action, self).deliver
  end

  def reset_instant_login
    update(instant_login_token: nil, instant_login_token_created_at: nil)
  end

  def self.authenticate_with_instant_login_token(token)
    valid_tokens.find_by(instant_login_token: token).tap do |user|
      user.reset_instant_login unless user.nil?
    end
  end
end

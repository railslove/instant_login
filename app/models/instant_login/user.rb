class InstantLogin::User < ActiveRecord::Base
  self.table_name = 'users'

  def generate_instant_login_token
    update(instant_login_token: SecureRandom.uuid, instant_login_token_created_at: Time.now)
  end

  def self.find_by_instant_login_token(token)
    where(instant_login_token: token).where('instant_login_token_created_at >= ?', 15.minutes.ago).first
  end
end

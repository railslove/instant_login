require "instant_login/engine"

module InstantLogin
  include ActiveSupport::Configurable

  # Name of the users table
  config_accessor(:user_table) { 'users' }

  # Redirect destination after successful or failed login
  config_accessor(:success_path) { '/' }
  config_accessor(:failure_path) { '/' }

  # By default we store the signed in user id in this session key
  config_accessor(:session_key) { 'user_id' }

  # Configuration for the mailer
  config_accessor(:mailer) { 'InstantLogin::UserMailer' }
  config_accessor(:mailer_action) { 'token' }

  # Convenience method to reset configuration
  def self.reset_configuration!
    config.user_table = 'users'
    config.success_path = '/'
    config.failure_path = '/'
    config.session_key = 'user_id'
    config.mailer = 'InstantLogin::UserMailer'
    config.mailer_action = 'token'
  end
end

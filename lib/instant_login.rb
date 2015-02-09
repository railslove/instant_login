require "instant_login/engine"
require "instant_login/adapters/active_record"

module InstantLogin
  include ActiveSupport::Configurable

  config_accessor(:user_class) { }
  config_accessor(:mailer_class) { }

  # Redirect destination after successful or failed login
  config_accessor(:success_path) { '/' }
  config_accessor(:failure_path) { '/' }

  # By default we store the signed in user id in this session key
  config_accessor(:session_key) { 'user_id' }

  # Convenience method to reset configuration
  def self.reset_configuration!
    config.user_class = nil
    config.user_mailer = nil
    config.success_path = '/'
    config.failure_path = '/'
    config.session_key = 'user_id'
  end
end

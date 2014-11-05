require "instant_login/engine"

module InstantLogin
  include ActiveSupport::Configurable

  config_accessor(:user_table) { 'users' }
  config_accessor(:success_path) { '/' }
  config_accessor(:failure_path) { '/' }
  config_accessor(:session_key) { 'user_id' }

  def self.reset_configuration!
    config.user_table = 'users'
    config.success_path = '/'
    config.failure_path = '/'
    config.session_key = 'user_id'
  end
end

require "instant_login/engine"

module InstantLogin
  include ActiveSupport::Configurable

  config_accessor(:user_table) { 'users' }
end

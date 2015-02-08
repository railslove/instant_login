module InstantLogin
  class Engine < ::Rails::Engine
    isolate_namespace InstantLogin
    config.generators do |g|
      g.test_framework :rspec, :view_specs => false
    end
    initializer 'instant_login.initialize' do |app|
      ActiveSupport.on_load :active_record do
        ActiveRecord::Base.extend InstantLogin::Adapters::ActiveRecord::Setup
        InstantLogin.config.user_class = InstantLogin.config.user_class.constantize
      end
    end
  end
end

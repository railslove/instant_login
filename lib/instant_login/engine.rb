module InstantLogin
  class Engine < ::Rails::Engine
    isolate_namespace InstantLogin
    config.generators do |g|
      g.test_framework :rspec, :view_specs => false
    end
    initializer 'instant_login.initialize' do |app|
      ActiveSupport.on_load :active_record do
        if InstantLogin.config.user_class.is_a?(ActiveRecord::Base)
          InstantLogin.config.user_class.send(:include, InstantLogin::Adapters::ActiveRecord)
        end
      end
    end

  end
end

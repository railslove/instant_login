require 'rails/generators/migration'

module InstantLogin
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration

      source_root File.expand_path('../templates', __FILE__)

      class_option :model, :optional => true, :type => :string, :banner => "model",
                   :desc => "Specify the model class name if you will use anything other than 'User'"

      def copy_initializer_files
        template "initializer.rb", "config/initializers/instant_login.rb"
      end


      private
        def model_class_name
          options[:model] ? options[:model].classify : "User"
        end

        def model_path
          @model_path ||= File.join("app", "models", "#{file_path}.rb")
        end
    end
  end
end

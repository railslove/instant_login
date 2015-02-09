require 'rails/generators/migration'

module InstantLogin
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration

      source_root File.expand_path('../templates', __FILE__)

      class_option :model, :optional => true, :type => :string, :banner => "model",
                   :desc => "Specify the model class name if you will use anything other than 'User'"
      class_option :migration, :optional => true, :type => :boolean, :banner => "no-migration", :default => true,
                   :desc => "Specify if you do not want to generate a migration file"

      def copy_initializer_files
        template "initializer.rb", "config/initializers/instant_login.rb"
      end

      def copy_migration_files
        migration_template "migration.rb", "db/migrate/instant_login_migration.rb" if options["migration"]
      end

      def self.next_migration_number(dirname)
        if ActiveRecord::Base.timestamped_migrations
          sleep 1 # make sure each time we get a different timestamp
          Time.new.utc.strftime("%Y%m%d%H%M%S")
        else
          "%.3d" % (current_migration_number(dirname) + 1)
        end
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

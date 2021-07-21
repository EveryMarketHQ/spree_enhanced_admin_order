module SpreeEnhancedAdminOrder
  module Generators
    class InstallGenerator < Rails::Generators::Base
      class_option :migrate, type: :boolean, default: true

      def add_javascripts
        append_file 'vendor/assets/javascripts/spree/backend/all.js', "//= require spree/backend/custom_shipment\n"
      end

      def add_stylesheets
        backend_css_file = "vendor/assets/stylesheets/spree/backend/all.css"
        if File.exist?(backend_css_file)
          inject_into_file backend_css_file, " *= require spree/backend/spree_custom_admin\n", :before => /\*\//, :verbose => true
        end
      end

      def add_migrations
        run 'bundle exec rake railties:install:migrations FROM=spree_enhanced_admin_order'
      end

      def run_migrations
        run_migrations = options[:migrate] || ['', 'y', 'Y'].include?(ask('Would you like to run the migrations now? [Y/n]'))
        if run_migrations
          run 'bundle exec rails db:migrate'
        else
          puts 'Skipping rails db:migrate, don\'t forget to run it!'
        end
      end
    end
  end
end

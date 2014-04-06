module SpreeLastAddress
  module Generators
    class InstallGenerator < Rails::Generators::Base
      class_option :auto_run_migrations, type: :boolean, default: false

      def add_javascripts
        append_file 'app/assets/javascripts/store/all.js', "//= require store/spree_last_address\n"
      end

      def add_stylesheets
        inject_into_file 'app/assets/stylesheets/store/all.css', " *= require store/spree_last_address\n", before: /\*\//, verbose: true
      end
    end
  end
end
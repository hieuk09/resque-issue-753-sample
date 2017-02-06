# -*- encoding : utf-8 -*-
require 'simple_config'

module Tp
  # This is a wrapper class for the Tp config.
  #
  # In addition to avoiding using a $global_variable for configuration,
  # it allows us to add helper methods to this class to extend the
  # functionality of our configs.
  class Config
    class << self
      # This delegates all methods to the SimpleConfig `config`
      # instance that is attached to this module.
      def method_missing(name, *args, &block)
        # Define the method once.
        singleton_class.delegate name, :to => :config
        send(name, *args, &block)
      end

    private

      def config
        @config ||= begin
          SimpleConfig.for(:application) do
            # Set here your global configuration.
            # All settings can be overwritten later per-environment.

            rails_root = File.dirname(__FILE__) + '/../..'

            load(
              File.join(rails_root, 'config', "settings", "application.rb"),
              :if_exists? => true
            )

            # Per Environment settings.
            # At startup only the file matching current environment
            # will be loaded.
            #
            # Settings stored here will overwrite settings with the same
            # name stored in application.rb
            load(
              File.join(rails_root, 'config', "settings", "#{Rails.env}.rb"),
              :if_exists? => true
            )

            # Local settings. It is designed as a place for you to override
            # variables specific to your own development environment.
            # Make sure your version control system ignores this file otherwise
            # you risk checking in a file that will override values in production
            load(
              File.join(rails_root, 'config', "settings", "local.rb"),
              :if_exists? => true
            ) if ENV["RAILS_TEST_LOCAL_CONFIG"].present? || Rails.env != "test"
          end
        end
      end
    end
  end
end

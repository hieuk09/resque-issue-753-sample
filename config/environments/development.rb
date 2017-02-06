SampleApp::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.delivery_method = :letter_opener if ENV['USE_LETTER_OPENER']

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Raise exception on mass assignment protection for Active Record models
  config.active_record.mass_assignment_sanitizer = :strict

  # Do not compress assets
  config.assets.compress = false
  # config.assets.logger = nil # Not valid yet, for now using quiet_assets
  config.logger = Logger.new(STDOUT)
  config.logger.level = Logger.const_get(ENV['LOG_LEVEL'] ? ENV['LOG_LEVEL'].upcase : 'WARN')

  ##
  # Use this to test asset_host config locally (use your own IP)
  #config.asset_host = "http://192.168.1.105:3000"

  # Expands the lines which load the assets
  config.assets.debug = true

  # no eager load code on boot
  config.eager_load = false

  # config.force_ssl = true
  config.after_initialize do
  end
end

TinyPulse::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # The test environment is used exclusively to run your application's
  # test suite. You never need to work with it otherwise. Remember that
  # your test database is "scratch space" for the test suite and is wiped
  # and recreated between test runs. Don't rely on the data there!
  config.cache_classes = true

  # no eager load code on boot
  config.eager_load = false

  # Serve static files server for tests with Cache-Control for performance
  config.serve_static_files = true
  config.static_cache_control = "public, max-age=3600"

  # Log error messages when you accidentally call methods on nil
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Raise exceptions instead of rendering exception templates
  config.action_dispatch.show_exceptions = false

  # Disable request forgery protection in test environment
  config.action_controller.allow_forgery_protection = false

  # Tell Action Mailer not to deliver emails to the real world.
  # The :test delivery method accumulates sent emails in the
  # ActionMailer::Base.deliveries array.
  config.action_mailer.delivery_method = :test

  # Raise exception on mass assignment protection for Active Record models
  config.active_record.mass_assignment_sanitizer = :strict
  config.action_controller.default_url_options = { host: 'app.lvh.me' }

  # default url option for test
  config.default_url_options = { host: 'app.lvh.me' }

  # Print deprecation notices to the stderr
  config.active_support.deprecation = :stderr

  # debug assets on test
  config.assets.debug = true

  # Rails log
  if ENV['LOG_TO_CONSOLE']
    config.logger = Logger.new(STDOUT)
    config.log_level = ENV['LOG_TO_CONSOLE']
  end

  # url options for host
  # config.action_controller.default_url_options = { host: 'local.host' }
  # Speed up tests by lowering BCrypt's cost function.
  require 'bcrypt'
  silence_warnings do
    BCrypt::Engine::DEFAULT_COST = BCrypt::Engine::MIN_COST
  end

  #
  # Since we use transactional fixtures we always have 1 open transactions by default.
  # Without this configuration, resque jobs will never run even so we use Resque inline.
  # Indeed, transactional_enqueue.rb will assume we are in a transaction and won't yield.
  #
  config.after_initialize do
      ActiveRecord::Base.normally_open_transactions = 1
  end

end

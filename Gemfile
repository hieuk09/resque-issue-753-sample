source 'https://rubygems.org'

ruby '2.3.1'

gem 'rails', '4.2.7'

# Protect attributes from mass-assignment in Active Record models.
# done with attr_accessible and attr_protected
gem 'protected_attributes'

#3rd party apis
gem "slack-ruby-client"
gem 'riif'
gem 'puma' # the web server!
gem 'puma_worker_killer'
gem 'mysql2', '0.3.18'
gem 'json'
gem 'net-scp', '1.1.0'
gem 'apipie-rails'
gem 'maruku'
gem 'simple_form'
gem 'nested_form'
# Ahoy tracking
gem 'ahoy_email'
gem 'ahoy_matey'

# Referer parser
gem 'referer-parser'
gem 'bootstrap-select-rails'
gem 'houston'

gem 'rest-client', '1.6.8'
# IMPORTANT: Don't upgrade `google-api-client` if not necessary
# it will impact PerformSync access tokens
gem 'google-api-client', '0.7.1'
gem 'jwt', '~> 0.1.4'
gem 'turbolinks'
gem 'ractive-rails'

# Gems used only for assets and not required
# in production environments by default.
gem 'retina_tag' # use to display images nicely on retina display
gem 'sass-rails'
gem 'compass-rails'
gem "sass-globbing"
gem 'uglifier', '>= 1.3.0'
gem 'asset_sync'
gem 'bootstrap-sass', '2.3.2.1'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'bootstrap_forms', '2.0.8'
gem "font-awesome-rails"
gem 'breakpoint'
gem 'haml_coffee_assets'
gem 'haml'
gem 'inky-rb', require: 'inky'
gem 'execjs'
gem 'sprockets-rails', '2.3.3'

gem 'erector'
gem 'acts_as_api'
gem 'spreadsheet'
gem 'bcrypt-ruby', '~> 3.0.0' # for has_secure_password
gem 'kaminari' # monkey patched in config/initializers/kaminari.rb
gem 'whenever', :require => false
gem 'rufus-scheduler'
gem 'encryptor'
gem 'cancan'
gem 'squeel'
gem 'draper'
# gem 'decorates_before_rendering'
gem 'simpleconfig', git: 'https://github.com/TINYhr/simpleconfig.git'
gem 'ar_after_transaction'
gem 'aws-sdk', '< 2.0'
gem 'heroic-sns'
# gem 'timezone'
gem 'RedCloth', :require => 'redcloth'
gem 'redcarpet'
gem 'workflow'
gem 'stripe', '~> 1.15.0'
gem 'htmlentities'
gem 'cabin'
gem 'memoist', '~> 0.14.0'
gem 'roadie-rails', '~> 1.0' # check config/initializers/empty_roadie_template.rb before update
gem 'premailer-rails'

gem 'rmagick', :require => false
gem 'rollout'
gem 'acts-as-taggable-on'
gem 'nondestructive_migrations'

gem 'gdata_19', git: 'https://github.com/TINYhr/GData.git', :require => 'gdata'
gem 'oauth'
gem 'omniauth-google-apps'
gem 'gabba', '~> 1.0', '>= 1.0.1'
# monitoring
# gem 'airbrake'
gem 'honeybadger'
gem 'newrelic_rpm'

# resque
gem 'resque'
gem 'resque-scheduler', '~> 2.5.5' , :require => 'resque_scheduler'
gem 'resque-cleaner', :require => nil
gem 'resque_mailer', git: 'https://github.com/zapnap/resque_mailer.git'
gem 'resque-timeout'
gem 'resque-jobs-per-fork'
gem 'resque-retry', '1.2.1'
gem 'hirefire-resource' # for scaling worker

# To use Jbuilder templates for JSON
# gem 'jbuilder'
gem 'roar-rails'

gem 'papertrail', :require => nil
gem 'carrierwave_direct'
gem 'fog', '1.20.0' # avoid upgrade to higher version because it breaks export survey as powerpoint
gem 'autosize'
gem 'zencoder'
gem 'secure_headers', '1.4.1'
gem 'mandrill-api'
gem 'platform-api'
gem 'faker', '~> 1.5.0'
gem 'redis-rails'
gem "recaptcha", '0.4.0', :require => "recaptcha/rails"
gem 'wisper', '1.6.1'
gem 'ledermann-rails-settings'

gem 'dry-validation', '0.10.5'
gem 'dry-struct'

# I don't want to add more dependencies, but ahoy already depend on this gem,
# so I guess I'll use it for convenient sake
gem 'browser'
gem 'searchkick', '1.4.0'
gem 'em-proxy'

# Copy to clipboard
gem 'zeroclipboard-rails', '~>0.0.13'
group :development do
  gem 'thin'
  gem 'rails-erd'
  gem 'parallel_tests'
  gem "erb2haml"
  gem 'growl'
  gem 'rb-fsevent'
  gem 'grit'
  # gem 'net-ssh'
  gem 'sitemap_generator'
  gem 'quiet_assets'
  gem "better_errors"
  gem "binding_of_caller" # for better_errors advanced features
  gem 'letter_opener'
  gem 'memory_profiler', require: false
  gem 'rack-mini-profiler', require: false
  gem 'stackprof', require: false
  gem 'get_process_mem'
  gem 'flamegraph'
  gem 'bullet'
  gem 'derailed'
  gem 'dry-types-rails'
end

group :development, :test do
  gem 'rspec'
  gem 'rspec-rails'
  gem 'rspec_junit_formatter'
  gem 'zeus-parallel_tests'
  gem 'fuubar'
  gem 'jasmine-rails'
  gem 'pry-rails'
  gem 'pry-doc'
  gem 'ruby_parser'
  gem 'ultrahook'
  gem 'spring'
  gem 'awesome_print'
  gem 'spring-commands-rspec'
  gem 'spring-commands-cucumber'
  gem 'codecov', require: false

  # mutant gem dependencies
  gem 'morpher'
  gem 'mutant-rspec'
  gem 'mutant'

  # Load config file
  gem 'dotenv-rails'
  gem 'byebug'
  gem 'timecop' # It's used in sample data generator in test organizations
  gem 'pry-byebug'
end

group :test do
  gem 'rspec-activemodel-mocks' # for legacy use of stub_model
  gem 'shoulda-matchers' # For test legacy purpose, don't use shoulda notation
  gem 'rspec-its' # For legacy purpose, don't use its notation
  gem 'rspec-collection_matchers'
  gem 'simplecov', '~> 0.11.0', :require => false # specify version due to exit code bug causing circle builds to pass incorrectly
  gem 'coveralls', require: false
  gem 'codeclimate-test-reporter'
  gem 'resque_spec'
  gem 'email_spec'
  gem 'factory_girl_rails', require: false
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'poltergeist'
  gem 'database_cleaner'
  # Make sure to disable webmock unless we explicitly require it:
  # http://groups.google.com/group/ruby-capybara/browse_thread/thread/1ffe422c96d94837/6303c01611d8af3f?show_docid=6303c01611d8af3f
  gem 'webmock', '>= 1.8.0', :require => false
  gem 'vcr'
  gem 'test_after_commit'
  gem "fakeredis", :require => "fakeredis/rspec"
  gem 'stripe-ruby-mock', '~> 2.0.5', :require => 'stripe_mock'
  gem 'selenium-webdriver'
  gem 'cucumber' # check features/support/tp_runner.rb before upgrade
  gem 'cucumber-rails', :require => false
  gem 'capybara-screenshot'
  gem "minitest"
end

#push notification for android using GCM
gem 'gcm'
gem 'activerecord-import'
gem 'intercom-rails'
gem 'intercom', "~> 3.4.0"
#remove unnecessary whitespaces https://github.com/holli/auto_strip_attributes
gem "auto_strip_attributes", "~> 2.0"
gem 'httparty'
gem 'test-unit'

# To validate JSON requests/responses
gem 'json-schema'
gem 'tinymce-rails'
gem 'net-sftp'
gem 'gpgme'

gem 'embiggen', '~> 1.1'
gem 'nokogiri'
gem "pismo"

gem 'oauth2'
gem 'rinku'
gem 'words_counted'
gem 'unscoped_associations'
gem 'jslint_on_rails'
gem 'awesome_nested_set'

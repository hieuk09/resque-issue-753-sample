source 'https://rubygems.org'

ruby '2.3.1'

gem 'rails', '4.2.7'

gem 'simpleconfig', git: 'https://github.com/TINYhr/simpleconfig.git'
gem 'puma' # the web server!
gem 'puma_worker_killer'
gem 'mysql2', '0.3.18'
gem 'json'

gem 'rest-client', '1.6.8'
gem 'redis-rails'
gem 'ar_after_transaction'
gem 'protected_attributes'

gem 'whenever', :require => false

# resque
gem 'resque'
gem 'resque-scheduler', '~> 2.5.5' , :require => 'resque_scheduler'
gem 'resque-cleaner', :require => nil
gem 'resque_mailer', git: 'https://github.com/zapnap/resque_mailer.git'
gem 'resque-timeout'
gem 'resque-jobs-per-fork'
gem 'resque-retry', '1.2.1'

group :development do
  gem 'thin'
end

group :development, :test do
  gem 'rspec'
  gem 'rspec-rails'
  gem 'rspec_junit_formatter'
  gem 'zeus-parallel_tests'
  gem 'byebug'
end

group :test do
  gem 'resque_spec'
  gem 'database_cleaner'
  gem "fakeredis", :require => "fakeredis/rspec"
end

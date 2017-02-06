source 'https://rubygems.org'

ruby '2.3.1'

gem 'rails', '4.2.7'

gem 'simpleconfig', git: 'https://github.com/TINYhr/simpleconfig.git'
gem 'puma' # the web server!
gem 'mysql2', '0.3.18'
gem 'json'

gem 'rest-client', '1.6.8'
gem 'redis-rails'
gem 'ar_after_transaction'
gem 'protected_attributes'

gem 'whenever', :require => false

# resque
gem 'resque'

group :development do
  gem 'thin'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'byebug'
end

group :test do
  gem 'database_cleaner'
  gem "fakeredis", :require => "fakeredis/rspec"
end

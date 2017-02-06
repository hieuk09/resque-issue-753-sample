
if !ENV['RUN_NIGHTLY_BUILD']
  require 'simplecov'
end

ENV["RAILS_ENV"] ||= 'test'
ENV['HONEYBADGER_ENV'] = 'test'

require 'rails/application'
require File.expand_path("../../config/environment", __FILE__)

require 'rspec/rails'
require 'rspec/collection_matchers'

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.use_transactional_fixtures = false

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.append_after(:each) do
    DatabaseCleaner.clean
    Timecop.return
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = false
  end

  config.filter_run :focus
  config.run_all_when_everything_filtered = true
end

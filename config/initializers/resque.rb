# Scheduler
Resque.redis = ENV['REDIS_URL']

# Failure backend
require 'resque-retry'
require 'resque/failure/redis'

Resque::Failure::MultipleWithRetrySuppression.classes = [Resque::Failure::Redis]

Resque::Failure.backend = Resque::Failure::MultipleWithRetrySuppression

# Make sure we only call Resque#enqueue outside a successful
# transaction COMMIT.
require 'resque/transactional_enqueue'
Resque.extend(Resque::TransactionalEnqueue)

# Configure a max run time for Resque jobs.
require 'resque-timeout'
Resque::Plugins::Timeout.timeout = 30.minutes.to_i

Resque.after_fork do |_job|
  # clears stale connections and re-activates active connections
  # in case server went away
  ActiveRecord::Base.connection_handler.clear_active_connections!
end

Resque.logger = Rails.logger

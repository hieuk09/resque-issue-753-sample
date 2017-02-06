# Scheduler
Resque.redis = ENV['REDIS_URL']

# Failure backend
require 'resque/failure/redis'

# Make sure we only call Resque#enqueue outside a successful
# transaction COMMIT.
require 'resque/transactional_enqueue'
Resque.extend(Resque::TransactionalEnqueue)

Resque.after_fork do |_job|
  # clears stale connections and re-activates active connections
  # in case server went away
  ActiveRecord::Base.connection_handler.clear_active_connections!
end

Resque.logger = Rails.logger

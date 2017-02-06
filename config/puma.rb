workers Integer(ENV['WEB_CONCURRENCY'] || 2)
threads_count  = Integer(ENV['RAILS_MAX_THREADS'] || 5)
threads threads_count, threads_count

preload_app!

rackup      DefaultRackup
port        ENV['PORT']     || 3000
environment ENV['RACK_ENV'] || 'development'


on_worker_boot do
  # Worker specific setup for Rails 4.1+
  # See: https://devcenter.heroku.com/articles/deploying-rails-applications-with-the-puma-web-server#on-worker-boot
  ActiveRecord::Base.establish_connection

  if defined?(Resque)
    Resque.redis = ENV["REDIS_URL"] || "redis://127.0.0.1:6379"
  end
end

before_fork do
  PumaWorkerKiller.config do |config|
    config.ram = (ENV['AVAILABLE_RAM'] || 1024).to_i
    config.frequency = (ENV['PUMA_WORKER_KILLER_FREQUENCY'] || (5 * 60)).to_i # seconds
    config.percent_usage = 0.99
  end
  PumaWorkerKiller.start
end


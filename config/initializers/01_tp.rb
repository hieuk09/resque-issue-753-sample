module Tp
  def self.redis
    @redis ||= Redis.new(host: Tp::Config.redis.url,
                         port: Tp::Config.redis.port,
                         password: Tp::Config.redis.password,
                         thread_safe: true)
  end

  def self.rollout
    @rollout ||= Rollout.new(redis)
  end
end

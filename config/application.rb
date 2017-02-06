require File.expand_path('../boot', __FILE__)

require 'rails/all'

if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
  Bundler.require(*Rails.groups(:assets => %w(development test)))
  # If you want your assets lazily compiled in production, use this line
  # Bundler.require(:default, :assets, Rails.env)
end


module SampleApp
  class Application < Rails::Application
    require File.join(Rails.root, 'lib', 'tp', 'config')

    config.autoload_paths += %w[lib].map { |path| "#{Rails.root}/#{path}" }


    config.active_support.escape_html_entities_in_json = true

    config.encoding = "utf-8"

    config.filter_parameters += [:password, :old_password, :new_password]

    config.assets.enabled = true

    config.assets.version = '1.0'

    config.assets.initialize_on_precompile = false
    config.cache_store = :redis_store, {host: Tp::Config.redis.url,
                                        port: Tp::Config.redis.port,
                                        password: Tp::Config.redis.password,
                                        db: 0,
                                        namespace: 'cache'}

    config.middleware.use Rack::Deflater

    config.active_record.raise_in_transactional_callbacks = true
  end
end

group :deployment do
  set :protocol, 'http'
end

group :surveys do
  set :old_baseline_question_count, 3
  set :baseline_question_count, 1
  set :ascension_mute_surveys, [1,11,21]
end

set :asset_host, nil

group :plans do
  set :minimum_receivers_count, 15
  set :wa_tax_rate, 0.096 # 2012-11-26 - 9.5 | 2015-06-09 - 9.6

  set :original_pricing_version, "20121101"
  set :bucket_pricing_v2013, "20131115"
  set :original_per_seat_editions_version, "20150210"
  set :per_seat_editions_v2, '20150315'
  set :flat_rate_version, "20150305"
  set :default_pricing_version, "20160301"

  set :default_edition, '4'
end

group :perform_plans do
  set :default_pricing_version, "20160509"
  set :flat_rate_version, "20160509"
  set :default_edition, '1'
end

group :slack_notification do
  set :test_channel, 'slack-test'
end

group :routing do
  set :skip_redirect_url, '/ahoy/visits'
  set :static_controllers, ['static_pages', 'landing_pages', 'contact']
  set :app_subdomain, 'app'
end

group :redis do
  set :url, 'localhost'
  set :port, 6379
  set :password, nil
end

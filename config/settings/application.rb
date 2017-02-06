group :deployment do
  set :protocol, 'http'
end

set :asset_host, nil

group :redis do
  set :url, 'localhost'
  set :port, 6379
  set :password, nil
end

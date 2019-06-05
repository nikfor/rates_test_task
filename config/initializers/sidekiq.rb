require 'sidekiq'

config    = Rails.application.config_for(:redis)
redis_url = "#{config['url']}/#{config['db']}"

Sidekiq.configure_client do |config|
  config.redis = { url: redis_url, namespace: "rates_#{Rails.env}" }
end

Sidekiq.configure_server do |config|
  config.redis = { url: redis_url, namespace: "rates_#{Rails.env}" }
end

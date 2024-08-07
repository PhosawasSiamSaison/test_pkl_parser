# config/initializers/sidekiq.rb
Sidekiq.configure_server do |config|
  config.logger = Logger.new(Rails.root.join('log', 'sidekiq.log'), 10, 10 * 1024 * 1024)
  config.logger.level = Logger::DEBUG
  config.redis = { url: 'redis://localhost:6379/0' }
end

Sidekiq.configure_client do |config|
  config.logger = Logger.new(Rails.root.join('log', 'sidekiq.log'), 10, 10 * 1024 * 1024)
  config.logger.level = Logger::DEBUG
  config.redis = { url: 'redis://localhost:6379/0' }
end
# config/initializers/redis.rb

redis_url = ENV['REDISCLOUD_URL'] || 'redis://localhost:6379/0'
$redis = Redis.new(url: redis_url)

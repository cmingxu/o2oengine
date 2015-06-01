if Rails.env.production?
  $redis = Redis.new port: 6378
  Resque.redis = $redis
else
  $redis = Redis.new
end





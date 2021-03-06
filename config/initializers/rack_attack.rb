class Rack::Attack
  Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new


  safelist('allow from localhost') do |req|
    '127.0.0.1' == req.ip || '::1' == req.ip
  end

  throttle('req/ip', limit: 5, period: 5.minutes) do |req|
    req.ip
  end

end

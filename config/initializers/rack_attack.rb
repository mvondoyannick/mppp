class Rack::Attack
    #   throttle('api/ip', limit: 10, period: 1.minutes) do |req|
    #     puts "Starting rack filters API limit ..."
    #     puts req.path
    #     puts req.ip
    #     # req.ip if req.path == "/api/v1/test" && req.get?
    #     req.ip if req.path == "/api"
    #   end
    
      throttle('root/ip', limit: 40, period: 1.minutes) do |req|
        puts "Starting rack filters ROOT limit ..."
        puts req.path
        puts req.ip
        # req.ip if req.path == "/api/v1/test" && req.get?
        req.ip # if req.path == "/"
      end
    end
    
    # Track requests from a special user agent.
    # Rack::Attack.track("SM-G900P Build/LRX21T") do |req|
    #   req.user_agent == "SM-G900P Build/LRX21T"
    # end
    
    # Supports optional limit and period, triggers the notification only when the limit is reached.
    # Rack::Attack.track("special_agent", limit: 6, period: 60) do |req|
    #   req.user_agent == "SpecialAgent"
    # end
    #
    # # Track it using ActiveSupport::Notification
    # ActiveSupport::Notifications.subscribe("track.rack_attack") do |name, start, finish, request_id, payload|
    #   req = payload[:request]
    #   if req.env['rack.attack.matched'] == "special_agent"
    #     Rails.logger.info "special_agent: #{req.path}"
    #     STATSD.increment("special_agent")
    #   end
    # end
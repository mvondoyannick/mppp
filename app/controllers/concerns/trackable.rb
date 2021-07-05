module Trackable
    extend ActiveSupport::Concern

    def track(name, properties = {})
        begin
            ahoy.track name, properties
        rescue StandardError => error
          # send error notification
        end
    end
    
end
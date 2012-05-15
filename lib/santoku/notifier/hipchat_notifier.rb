require 'httparty'

module Santoku
  module Notifier
    class HipchatNotifier
      
      def initialize(config)
        @url   = "http://api.hipchat.com/v1/rooms/message"
        
        @token = config[:hipchat][:token]
        @room  = config[:hipchat][:room]
        @from  = config[:hipchat][:from]
        @alert = config[:hipchat][:alert]
        @color = config[:hipchat][:color]
      end
      
      def notify(msg)
        HTTParty.post("#{@url}?format=json&auth_token=#{@token}&message=#{URI.escape(msg)}&room_id=#{@room}&from=#{@name}")
      end
      
    end
  end
end
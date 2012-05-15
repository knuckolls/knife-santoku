require 'httparty'

module Santoku
  module Notification
    class HipchatNotifier
      
      def initialize(config)
        @url   = "http://api.hipchat.com/v1/rooms/message"
        
        @token = config["hipchat"]["token"]
        @room  = config["hipchat"]["room"]
        @from  = config["hipchat"]["from"]
        @notify = 0 if config["hipchat"]["notify"] == false
        @notify = 1 if config["hipchat"]["notify"] == true
        @color = config["hipchat"]["color"]
      end
      
      def notify(msg)
        url = "#{@url}?format=json&auth_token=#{@token}&message=#{URI.escape(msg)}&room_id=#{@room}&from=#{@from}&notify=#{@notify}&color=#{@color}"
        HTTParty.post(url)
      end
      
    end
  end
end
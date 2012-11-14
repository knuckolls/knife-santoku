require 'tinder'

module KnifeSantoku
  module Notification
    class CampfireNotifier
      
      def initialize(config)
        
        @subdomain = config["campfire"]["subdomain"]
        @token = config["campfire"]["token"]
        @room  = config["campfire"]["room"]
        @notify = 0 if config["campfire"]["notify"] == false
        @notify = 1 if config["campfire"]["notify"] == true
      end
      
      def notify(msg)
        campfire = Tinder::Campfire.new "#{@subdomain}" , :token => "#{@token}" 
        room = campfire.rooms.find_room_by_id(@room)
        room.speak(msg) if @notify
      end
      
    end
  end
end
require 'pony'

module KnifeSantoku
  module Notification
    class EmailNotifier
      
      def initialize(config)
        
        @to = config["email"]["to"]
        @from = config["email"]["from"]
        @subject  = config["email"]["subject"]
        @address  = config["email"]["address"]
        @port  = config["email"]["port"]
        @enable_tls  = config["email"]["enable_tls"]
        @user_name  = config["email"]["user_name"]
        @password  = config["email"]["password"]
        @auth = config["email"]["authentication"]
        @domain = config["email"]["domain"]
        @notify = 0 if config["email"]["notify"] == false
        @notify = 1 if config["email"]["notify"] == true
      end
      
      def notify(msg)
        Pony.mail({
          :to => "#{@to}", 
          :from => "#{@from}", 
          :subject => "#{@subject}", 
          :body => "#{msg}",
          :via => :smtp,
          :via_options => {
            :address => "#{@address}",
            :port => "#{@port}",
            :enable_starttls_auto => "#{@enable_tls}",
            :user_name => "#{@user_name}",
            :password => "#{@password}",
            :authentication => ":#{@auth}",
            :domain => "#{@domain}"
            }}) if @notify
      end
      
    end
  end
end
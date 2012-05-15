module Santoku
  class Notifier    
    #def initialize(config, lib_folder)
    def initialize(config)
      @config = config
      
      @notifiers = { :hipchat => ::Santoku::Notification::HipchatNotifier.class }
      
      # iterate through our internal folder and our external folder for notification classes
    end
    
    def notify(type, msg)
      klass = @notifiers[type]
      notifier = klass.new(@config)
      
      notifier.notify(msg)
    end
  end
end
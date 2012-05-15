require 'chef/mixin/from_file'

module Santoku
  class Callback
    
    def initialize(file, notifier, argv)
      @file = file
      @notifier = notififer
      @argv = argv
    end
    
    def run
      from_file(@file)
    end
    
    def match(regexp, &proc)
      matches = regexp.match(@argv)

      if matches != nil and matches.length > 1

        # drop the 'full match' off the front and leave the captures
        matches = matches.to_a.drop(1)

        proc.call(*matches)
      end
    end
    
    def notify(type, msg)
      @notifier.notify(type, msg)
    end
  end
end
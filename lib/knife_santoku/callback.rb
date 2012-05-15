require 'chef/mixin/from_file'
require 'etc'

module KnifeSantoku
  class Callback
    
    include Chef::Mixin::FromFile
    
    def initialize(file, notifier, argv)
      @file = file
      @notifier = notifier
      @argv = argv.join(" ")
    end
    
    def run
      from_file(@file)
    end
    
    def match(regexp, &proc)
      matches = regexp.match(@argv)

      if (matches != nil and matches.length > 1)

        # drop the 'full match' off the front and leave the captures
        matches = matches.to_a.drop(1)

        proc.call(*matches)
      elsif @argv =~ regexp
        proc.call
      end
    end
    
    def notify(type, msg="#{Etc.getlogin} ran: #{@argv}")
      @notifier.notify(type, msg)
    end

  end
end
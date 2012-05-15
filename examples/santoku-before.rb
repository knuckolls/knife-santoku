## Put this in config/santoku-before.rb

require 'etc'

match /cookbook upload (.*)/ do |cookbook|
  notify :hipchat, "#{Etc.getlogin} started uploading #{cookbook}"
end
## Put this in config/santoku-before.rb
## Use :hipchat, :campfire, :email for the use of each notifier

require 'etc'

match /cookbook upload (.*)/ do |cookbook|
  notify :hipchat, "#{Etc.getlogin} started uploading #{cookbook}"
end

match /cookbook upload (.*)/ do |cookbook|
  notify :campfire, "#{Etc.getlogin} started uploading #{cookbook}"
end

match /cookbook upload (.*)/ do |cookbook|
  notify :email, "#{Etc.getlogin} started uploading #{cookbook}"
end


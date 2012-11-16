## Put this in config/santoku-after.rb
## Use :hipchat, :campfire, :email for the use of each notifier

match /spork/ do
  notify :hipchat, "Someone used the spork plugin"
end

match /spork/ do
  notify :campfire, "Someone used the spork plugin"
end

match /spork/ do
  notify :email, "Someone used the spork plugin"
end

match /from file/ do
  notify :hipchat
end

require 'etc'
match /cookbook upload (.*)/ do |cookbook|
  notify :hipchat, "#{Etc.getlogin} finished uploading #{cookbook}"
end

match /create/ do
  notify :hipchat
end

match /delete/ do
  notify :hipchat
end

match /bootstrap/ do 
  notify :hipchat
end

match /bootstrap/ do 
  notify :campfire
end

match /bootstrap/ do 
  notify :email
end
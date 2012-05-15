match /spork/ do
  notify :hipchat, "Someone used the spork plugin"
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

match /boostrap/ do 
  notify :hipchat
end
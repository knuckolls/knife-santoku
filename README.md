# Santoku 
A drop in replacement for knife that helps you build out processes around Chef.

![Santoku](http://upload.wikimedia.org/wikipedia/commons/a/aa/Kitchen-knife-santoku-form.jpg)
http://en.wikipedia.org/wiki/Santoku

## Overview

Santoku is primarily used for firing off notifications when knife commands are run. There are two concepts in Santoku: callbacks, and notifiers. Santoku fires off callbacks before and after any knife command is run. Callbacks can be any arbitrary ruby code in config/santoku-before.rb or config/santoku-after.rb. However, they are primarily made up of regexp matcher functions that fire off notifications to Santoku notification plugins. 

Right now only Hipchat is support has been written. More work will be done to let you drop your own notification classes into the  lib/santoku/ folder of your chef repo to build integrations with your favorite systems. If you build out something and would like it added to the master project just send me a pull request.

You don't have to use Santoku for notifications, that's just what it was originally built for.

## Usage

Just run knife commands with the santoku command instead of knife. 

For example, any time you would have run this:

	knife cookbook upload rabbitmq

just run it with santoku instead

	santoku cookbook upload rabbitmq

## Configuration

Put this in config/santoku-config.yml

	hipchat:
	    token: "your_hipchat_api_token"
	    room: "developers"
	    from: "Knife"
	    notify: false
	    color:  "yellow"

Put something like this in your config/santoku-before.rb or config/santoku-after.rb. These matchers will make sure that only commands that alter the chef server send off a notification.

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

	match /bootstrap/ do 
	  notify :hipchat
	end
	
If you placed that in the config/santoku-after.rb file, you should start receiving notifications in your hipchat room whenever someone alters something on the server with knife.

## Installation

Add this line to your application's Gemfile:

    gem 'santoku'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install santoku

## Todo
* Add in the logic for end user drop in notification plugins
* Better tests
* Merge real callback functionality into the upstream knife codebase.
  * Santoku only lets you notify before and after knife commands. 
  * It would be best and most flexible to be able to hook right in with knife inside opscode's codebase.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

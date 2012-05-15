require 'app_conf'
require 'chef/knife'

module KnifeSantoku
  class Application
    def initialize(argv)
      @active = false
            
      chef_conf_dir = ::Chef::Knife.chef_config_dir
      
      config_file = "#{chef_conf_dir}/../config/santoku-config.yml"
      before_file = "#{chef_conf_dir}/../config/santoku-before.rb"
      after_file  = "#{chef_conf_dir}/../config/santoku-after.rb"
      lib_folder  = Pathname.new("#{chef_conf_dir}/../lib/santoku/")
      
      if File.exists?(config_file) and (File.exists?(before_file) or File.exists?(after_file))
        @active = true
        
        config = AppConf.new
        config.load(config_file)

        # load up notifiers & custom code out of lib
        #notifier = Notifier.new(config,lib_folder)
        notifier = ::KnifeSantoku::Notifier.new(config)
            
        # load up callbacks
        @before_callbacks = Callback.new(before_file, notifier, argv)
        @after_callbacks  = Callback.new(after_file, notifier, argv)
      end
    end
    
    def run_before_callbacks
      @before_callbacks.run if @active
    end
    
    def run_after_callbacks
      @after_callbacks.run if @active
    end
  end
end
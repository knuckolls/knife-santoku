## Monkeypatch knife to add in callback support

class Chef::Application::Knife
  
  # Run knife
  def run
    Mixlib::Log::Formatter.show_time = false
    validate_and_parse_options
    quiet_traps
    
    ## added by santoku
    before_callbacks(ARGV)
    
    Chef::Knife.run(ARGV, options)
    
    ## added by santoku
    after_callbacks(ARGV)

    exit 0
  end

  def before_callbacks(args)
    puts "before"
  end

  def after_callbacks(args)
    puts "after"
  end

end
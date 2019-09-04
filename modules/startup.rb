module Startup
def startup
    require 'logger'
    require 'date'
  
      path = File.join(ENV["LOGDIR"] || "./" ,"v.log")
      file   = File.open(path, File::WRONLY|File::TRUNC|File::CREAT) 
      $log = Logger.new(path)
      $log.level = Logger::DEBUG
      today = Date.today
      $log.info "Field demo #{$0} started on #{today}"
      FFI::NCurses.init_pair(10,  FFI::NCurses::WHITE,   FFI::NCurses::GREEN) # statusline
  end

end
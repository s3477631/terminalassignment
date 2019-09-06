 require_relative "./modules/footer"
require_relative "./modules/alert"
require_relative "./modules/startup"
require_relative "./modules/statusline"
require_relative "./modules/userprofile"
require_relative "./modules/startpage"
require_relative './modules/startview'
require_relative './classes/init_screen'
include Startview
include Footer 
include Alert
include Startup
include Statusline
include Userprofile
include Startpage

Windowinstancer.new.groundzero(1,1,1) 



    
    
#      destroystartpage
  # setupuserprofile
#     end

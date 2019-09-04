#!/usr/bin/env ruby
# example showing only labels and fields a window
# 2018-03-10 
require 'umbra'
require 'umbra/label'
require 'umbra/field'
require 'rubygems'
require "active_support/all"
require 'time_difference'
require 'date'
require_relative "./modules/footer"
require_relative "./modules/alert"
require_relative "./modules/startup"
require_relative "./modules/statusline"
require_relative "./modules/userprofile"
require_relative "./modules/startpage"
include Footer 
include Alert
include Startup
include Statusline
include Userprofile
include Startpage


   displaystartpage
#    if win.getkey == FFI::NCurses::KEY_UP
#     destroystartpage
#     setuserprofile
#    end

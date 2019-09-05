module Startpage
    def displaystartpage
        require 'umbra'
        require 'umbra/label'
        require 'umbra/listbox'
        require 'umbra/textbox'
        require 'umbra/togglebutton'
        require 'umbra/box'
        require 'rubygems'
        require "active_support/all"
        require 'time_difference'
        require 'date'
        include Startview
        include Bottombar
        include Umbra
        startup
        def statusline win, str, column = 1
          # LINES-2 prints on second last line so that box can be seen
          win.printstring( FFI::NCurses.LINES-2, column, str, 6, REVERSE)
        end
    end        
end

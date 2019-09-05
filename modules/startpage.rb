module Startpage
    def displaystartpage
        include Umbra
        init_curses
        startup
        FFI::NCurses.init_pair(12,  COLOR_WHITE, FFI::NCurses::COLOR_MAGENTA)
        win = Window.new
        statusline(win, "Ctrl+Q:Close |Enter:Save |Left: Diet Plan |Right: Exercise Plan", 10)
        title = Label.new( :text => "Setup User Profile", :row => 0, :col => 0 , :width => FFI::NCurses.COLS-1, 
            :justify => :center, :color_pair => CP_GREEN)
        form = Form.new win
        form.add_widget title
     

        while (ch = win.getkey) != FFI::NCurses::KEY_CTRL_Q

            begin
              form.handle_key ch
        
              if win.getkey == FFI::NCurses::KEY_RETURN
                
          def destroystartpage
                
             win.destroy
             FFI::NCurses.endwin
             exit

          
        end
        end
    end
end
end
end

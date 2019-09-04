module Startpage
    def displaystartpage
        include Umbra
        init_curses
        startup
        FFI::NCurses.init_pair(12,  COLOR_WHITE, FFI::NCurses::COLOR_MAGENTA)
        win = Window.new
        statusline(win, "Ctrl+Q:Close |Enter:Save |Left: Diet Plan |Right: Exercise Plan", 10)
        title = Label.new( :text => "Setup User Profile", :row => 0, :col => 0 , :width => FFI::NCurses.COLS-1, 
            :justify => :center, :color_pair => CP_BLUE)
        form = Form.new win
        form.add_widget title
        while (ch = win.getkey) != FFI::NCurses::KEY_CTRL_Q

            begin
              form.handle_key ch
        
              if ch == FFI::NCurses::KEY_RETURN && "#{dob}" != ''
               
                
          def destroystartpage
                
            win = Window.new
            win.printstring(10,10, "Thank you #{name}! your user profile has been created!");
            win.wrefresh
            ensure
            win.destroy
            FFI::NCurses.endwin
            exit
            end
            end
        
        
            rescue => e
              _alert(e.to_s)
              $log.error e
              $log.error e.backtrace.join("\n")
              e = nil
            end
            win.wrefresh
          end
          
        rescue => e
          win.destroy if win
          FFI::NCurses.endwin
          puts "printing inside rescue"
          puts e
          puts e.backtrace.join("\n")
          e = nil
        ensure
          win.destroy if win
          FFI::NCurses.endwin
          if e
            puts "printing inside ensure"
            puts e 
            puts e.backtrace.join("\n")
          end
        end
        end

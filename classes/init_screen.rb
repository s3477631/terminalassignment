class Windowinstancer
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
    require_relative '../modules/startup'
    require_relative '../modules/statusline'
    include Umbra
    include Startup
    include Statusline
    attr_accessor :createnewbtn
    def initialize(x, y, str)
        init_curses
        startup
        FFI::NCurses.init_pair(12,  COLOR_WHITE, FFI::NCurses::COLOR_MAGENTA)
        win = Window.new
        win.box
        form = Form.new win
        col = 1
        statusline(win, " "*(win.width-0), 0)
        str = " Welcome to your Personal Fitness & Nutrition Manager "
        win.title str
        win.printstring( FFI::NCurses.LINES-2, col, " Press Ctrl + Q to EXIT ", 6, REVERSE)
        createnewbtn = Button.new text: "Create New", row: 10, col: 1
        viewdietbtn = Button.new text: "View Diet" , row: 10, col: 30
        viewexercisesbtn = Button.new text: "View Exercises" , row: 80, col: 50
        bbox = Box.new row: 19, col: 1, height: 3, width: 45, visible: false
        bbox.flow  createnewbtn, viewdietbtn, viewexercisesbtn
        form.add_widget createnewbtn, viewdietbtn, viewexercisesbtn
        form.pack
        form.select_first_field
        form.add_widget createnewbtn, viewdietbtn, viewexercisesbtn
        form.pack
        form.select_first_field
        win.wrefresh    
        y = x = 1
        createnewbtn.command do 
       
        ## NEED TO PASS createnewbtn.command to a class that handles adding/destroying widgets    
            title = Label.new( :text => "Setup User Profile", :row => 2, :col => 0 , :width => FFI::NCurses.COLS-1, 
                              :justify => :center, :color_pair => CP_BLUE)
            form.add_widget title
            labels = ["Name:", "Weight(kg):", "Height(m):","Dob(yyyy-mm-dd):"]
            labs = []        
            row = 3
            col = 5
            labels.each_with_index {|lab, ix| 
            w = Label.new( :text => lab, :row => row, :col => col , :width => 20)
            labs << w
            row += 4
            w.color_pair = CP_RED
            w.justify = :right
            w.attr = FFI::NCurses::A_BOLD
            form.add_widget w
          }
          
    
#     fielder = Field.new( :name => lab, :row => row, :col => col , :width => 35)
#     fielder.color_pair = CP_MAGENTA
#     fielder.attr = FFI::NCurses::A_REVERSE
#     fielder.highlight_color_pair = CP_WHITE
#     fielder.highlight_attr = REVERSE
#     fielder.null_allowed = false
#     form.add_widget fielder
#   }
          end

          viewdietbtn.command do
         
            title = Label.new( :text => "View Diet", :row => 2, :col => 0 , :width => FFI::NCurses.COLS-1, 
                :justify => :center, :color_pair => CP_BLUE)
                form.add_widget title
                form.repaint
                 win.wrefresh
                 
          end



while (ch = win.getkey) != FFI::NCurses::KEY_CTRL_Q
        begin
        form.handle_key ch
        
        rescue => e
        puts e
        puts e.backtrace.join("\n")
        alert e.to_s
        end
        win.wrefresh
end
        rescue => e
            win.destroy if win
            win = nil
            FFI::NCurses.endwin
            puts e
            puts e.backtrace.join("\n")
            ensure
                win.destroy if win
                FFI::NCurses.endwin
                if e
                puts e 
                puts e.backtrace.join("\n")
                end
        end
end

   
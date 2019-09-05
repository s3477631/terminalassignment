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
        str = " Press Ctrl + Q to EXIT "
        statusline(win, " "*(win.width-0), 0)
        win.printstring( FFI::NCurses.LINES-2, col, str, 6, REVERSE)
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

   
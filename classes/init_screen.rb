class Windowinstancer
    require 'umbra'
    require 'umbra/label'
    require 'umbra/listbox'
    require 'umbra/textbox'
    require 'umbra/togglebutton'
    require 'umbra/box'
    require 'umbra/label'
    require 'rubygems'
    require 'umbra/labeledfield'
    require 'umbra/messagebox'
    require "active_support/all"
    require 'time_difference'
    require 'date'
    require_relative '../modules/startup'
    require_relative '../modules/statusline'
    include Umbra
    include Startup
    include Statusline
    attr_accessor :tedo
    def groundzero(x, y, str)
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
        win.wrefresh    
        y = x = 1
      
        createnewbtn.bind_event(:PRESS) do |f|
            
            mb = MessageBox.new title: "Please Enter Personal Information", width: 80 do
                add LabeledField.new label:"Name:",text: "John Smith", col: 15, color_pair: CP_GREEN, attr: REVERSE
                add LabeledField.new label:"Weight(kg):", name:"weight", text:"120", col: 15, color_pair: CP_GREEN, attr: REVERSE
                add LabeledField.new label:"Height(m):", name:"height", text:"1.70", maxlen: 70, col: 15, color_pair: CP_GREEN, attr: REVERSE
                add LabeledField.new label:"DOB:", name:"dobt", text:"2019-12-31", maxlen: 70, col: 15, color_pair: CP_GREEN, attr: REVERSE
            
           
            end
            

              mb.run
         end

         
         
            
        viewdietbtn.bind_event(:PRESS) do |f|
           btnEtr = Button.new text: "View Diet" , row: 8, col: 30
            mb = MessageBox.new title: "Nutritional log", buttons: nil, width: 80 do
            add btnEtr
            btnEtr.bind_event(:PRESS) do |f|
                array = File.read($0).split("\n")
                mb = MessageBox.new title: "#{array[0]}", width: 80 do
                end
                mb.run
             end
        end
        mb.run
                 end

                
         
#         createnewbtn.command do 
#     #    def self.addform
#         ## NEED TO PASS createnewbtn.command to a class that handles adding/destroying widgets    
#         labels = ["Name:", "Age:", "Address:","Mobile No.:", "Email Id:","Hobbies:"]
#         names = ["name", "age", "address","mobile", "email","hobbies"]
       
#         row = 3
#         col = 30
#         names.each_with_index {|lab, ix| 
#           w = LabeledField.new( :name => lab, :row => row, :col => col , :width => 50, label: labels[ix],
#                                :label_highlight_attr => BOLD
#                               )
#           row += 2
#           w.color_pair = CP_CYAN
#           w.attr = FFI::NCurses::A_REVERSE
#           w.highlight_color_pair = CP_YELLOW
#           w.highlight_attr = REVERSE
#           w.null_allowed = true
#           form.add_widget w
#           form
#         }
          
    
# #     fielder = Field.new( :name => lab, :row => row, :col => col , :width => 35)
# #     fielder.color_pair = CP_MAGENTA
# #     fielder.attr = FFI::NCurses::A_REVERSE
# #     fielder.highlight_color_pair = CP_WHITE
# #     fielder.highlight_attr = REVERSE
# #     fielder.null_allowed = false
# #     form.add_widget fielder
# #   }
#     end
   

          viewdietbtn.command do
           
           
                 
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

   
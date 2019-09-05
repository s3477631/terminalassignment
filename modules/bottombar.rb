module Bottombar

    def mainvisual
init_curses
startup
win = Window.new #20,100, 0, 20
statusline(win, " "*(win.width-0), 0)
win.box
statusline(win, "Press Ctrl+Q to Quit", 20)
str = " Welcome to your Personal Fitness & Nutrition Manager "
win.title str
catch(:close) do
    form = Form.new win
# tb = ToggleButton.new onvalue: "Create New", offvalue: "No Border", row: brow, col: 10, value: true
createnewbtn = Button.new text: "Create New", row: 80, col: 10
viewdietbtn = Button.new text: "View Diet" , row: 80, col: 30
viewexercisesbtn = Button.new text: "View Exercises" , row: 80, col: 50

 bbox = Box.new row: 18, col: 12, height: 3, width: 65, visible: false
 bbox.flow  createnewbtn, viewdietbtn, viewexercisesbtn

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
end # close

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
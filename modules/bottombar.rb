module Bottombar

    def mainvisual
include Umbra
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

box = Box.new row: 1,col: 4, height: -5, width: 40, title: "User Profiles", justify: :left
brow = box.row+box.height+2
# tb = ToggleButton.new onvalue: "Create New", offvalue: "No Border", row: brow, col: 10, value: true
createnewbtn = Button.new text: "Create New", row: brow, col: 10
ab = Button.new text: "View Diet" , row: brow, col: 30
logb = Button.new text: "View Exercises" , row: brow, col: 50
bbox = Box.new row: brow-2, col: 8, height: 3, width: 65, visible: false
bbox.flow  createnewbtn, ab,logb
form.add_widget createnewbtn
form.add_widget ab
form.add_widget logb, box, bbox
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
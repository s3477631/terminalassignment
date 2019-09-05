module Alert
def _alert str 
    win = _create_window
    FFI::NCurses.init_pair(12,  COLOR_WHITE, FFI::NCurses::RED)
    cp = create_color_pair(COLOR_RED, COLOR_WHITE)
    win.wbkgd(FFI::NCurses.COLOR_PAIR(cp)) # white on red, defined here
    win.printstring(0,1, "Please enter all fields. Refer to labels for units")
    win.wrefresh
    win.getkey
    win.destroy
  end
end
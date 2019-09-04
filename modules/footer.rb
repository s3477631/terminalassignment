module Footer
def create_footer_window h = 2 , w = FFI::NCurses.COLS, t = FFI::NCurses.LINES-5, l = 0
    ewin = Window.new(h, w , t, l)
  end
end
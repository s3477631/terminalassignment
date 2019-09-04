module Statusline
def statusline win, str, col = 0
    win.printstring( FFI::NCurses.LINES-2, col, str, 10)
  end
end
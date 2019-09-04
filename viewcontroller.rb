#!/usr/bin/env ruby
# example showing only labels and fields a window
# 2018-03-10 
require 'umbra'
require 'umbra/label'
require 'umbra/field'
require_relative "./modules/footer"
require_relative "./modules/alert"
require_relative "./modules/startup"
require_relative "./modules/statusline"

include Footer 
include Alert
include Startup
include Statusline


begin

  include Umbra
  init_curses
  startup
  #FFI::NCurses.init_pair(12,  COLOR_WHITE, FFI::NCurses::RED)
  win = Window.new
  #statusline(win, " "*(win.width-0), 0)
  statusline(win, "ctrl+Q:Close |ctrl+S:Save |ctrl+D:Diet Plan |ctrl+K:Exercise Plan", 10)
 
  title = Label.new( :text => "Setup Userprofile", :row => 0, :col => 0 , :width => FFI::NCurses.COLS-1, 
                    :justify => :center, :color_pair => CP_BLACK)

  form = Form.new win
  form.add_widget title
  labels = ["Name:", "Weight(kg):", "Height(m):","Dob(dd/mm/yy):"]
  labs = []
  row = 3
  col = 5
  labels.each_with_index {|lab, ix| 
    w = Label.new( :text => lab, :row => row, :col => col , :width => 20)
    labs << w
    row += 4
    w.color_pair = CP_WHITE
    w.justify = :right
    w.attr = FFI::NCurses::A_BOLD
    form.add_widget w
  }
  labels = ["Devin Reeks", "80","180", "d.o.b"]
  labels = ["name", "weight(kg)","height(m)", "d.o.b"]
 
  row = 3
  col = 25
  fhash = {}
  labels.each_with_index {|lab, ix| 
    w = Field.new( :name => lab, :row => row, :col => col , :width => 35)
    fhash[lab] = w
    row += 4
    w.color_pair = CP_CYAN
    w.attr = FFI::NCurses::A_REVERSE
    w.highlight_color_pair = CP_YELLOW
    w.highlight_attr = REVERSE
    w.null_allowed = false
    form.add_widget w
  }
  
  #onchange bound event
   fhash["name"].type = :alpha
   fhash["name"].bind_event(:CHANGE) do |f|
    name = "#{f.getvalue}"
  end
   fhash["weight(kg)"].type = :integer
   fhash["weight(kg)"].maxlen = 3
   fhash["weight(kg)"].bind_event(:CHANGE) do |f|
    weight = "#{f.getvalue}"
  end
   fhash["height(m)"].type = :float
   fhash["height(m)"].maxlen = 4
   fhash["height(m)"].bind_event(:CHANGE) do |f|
    height = "#{f.getvalue}"
  end
   fhash["d.o.b"].valid_regex = /\d{1,2}\d{1,2}\d{2,4}/
  # fhash["mobile"].chars_allowed = /[\d\-]/
  # fhash["mobile"].maxlen = 10
  # fhash["mobile"].bind_event(:CHANGE) do |f|
  #   message_label.text = "#{f.getvalue.size()} chars entered"
  #   statusline(win, "#{f.getvalue.size()} chars entered")
  #   message_label.repaint_required
  # end
  # fhash["email"].chars_allowed = /[\w\+\.\@]/
  # fhash["email"].valid_regex = /\w+\@\w+\.\w+/
  # fhash["age"].valid_range = (18..100)
  # fhash["age"].type = :integer
  form.pack
  form.select_first_field
  win.wrefresh
 

  y = x = 1

  while (ch = win.getkey) != FFI::NCurses::KEY_CTRL_Q

    begin
      form.handle_key ch

      if ch == FFI::NCurses::KEY_RETURN
    begin
    win = Window.new
    win.printstring(10,10, "#{name}");
    win.wrefresh
   win.getchar
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


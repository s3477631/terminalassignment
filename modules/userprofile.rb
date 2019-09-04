module Userprofile
    def setupuserprofile
  include Umbra
  init_curses
  startup
  FFI::NCurses.init_pair(12,  COLOR_WHITE, FFI::NCurses::COLOR_MAGENTA)
  win = Window.new
  #statusline(win, " "*(win.width-0), 0)
  statusline(win, "Ctrl+Q:Close |Enter:Save |Left: Diet Plan |Right: Exercise Plan", 10)
  name = ''
  dob = ''
  weight = ''
  height = 0.0
  title = Label.new( :text => "Setup User Profile", :row => 0, :col => 0 , :width => FFI::NCurses.COLS-1, 
                    :justify => :center, :color_pair => CP_BLUE)

  
  form = Form.new win
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


  
  labels = ["Devin Reeks", "80","180", "dob"]
  labels = ["name", "weight(kg)","height(m)", "dob"]
 
  row = 3
  col = 25
  fhash = {}
  labels.each_with_index {|lab, ix| 
    w = Field.new( :name => lab, :row => row, :col => col , :width => 35)
    fhash[lab] = w
    row += 4
    w.color_pair = CP_MAGENTA
    w.attr = FFI::NCurses::A_REVERSE
    w.highlight_color_pair = CP_WHITE
    w.highlight_attr = REVERSE
    w.null_allowed = false
    form.add_widget w
  }
  
  #onchange bound event
   fhash["name"].type = :alpha
   fhash["name"].valid_regex = /\w[A-z]+/
   fhash["name"].bind_event(:CHANGE) do |f|
    name = "#{f.getvalue}"
    win.printstring(FFI::NCurses.LINES-19, col, "Hello #{name}, it's going to be a pleasure hanging out", 10 )
  end
   fhash["weight(kg)"].type = :integer
   fhash["weight(kg)"].maxlen = 3
   fhash["weight(kg)"].valid_range = (20..300)
   fhash["weight(kg)"].bind_event(:CHANGE) do |f|
    weight = "#{f.getvalue}"
    win.printstring(FFI::NCurses.LINES-15, col, "I weigh #{weight} kilograms or #{(weight.to_i * 2.2).round(3)} lbs", 10)
  end
   fhash["height(m)"].type = :float
   fhash["height(m)"].maxlen = 4
   fhash["height(m)"].valid_range = (0.5..2.5)
   fhash["height(m)"].bind_event(:CHANGE) do |f|
    height = "#{f.getvalue}"
    win.printstring(FFI::NCurses.LINES-11, col, "I'm #{height} m tall or #{(height.to_f * 3.2).round(1)} ft", 10)
  end
   fhash["dob"].valid_regex = /\d{2,4}-\d{1,2}-\d-{1,2}/
  # fhash["mobile"].chars_allowed = /[\d\-]/
  # fhash["mobile"].maxlen = 10
  fhash["dob"].bind_event(:CHANGE) do |f|
     dob = "#{f.getvalue}"

     if dob.length() >= 10 
        today = Time.new
        today_year = today.year
        today_month = today.month
        today_day = today.day
        start_date = Date.parse("#{dob}")
        end_date =  Date.parse("#{today_year}-#{today_month}-#{today_day}")
        outputans = (end_date - start_date)
        outputans = (outputans.to_i/365)
        win.printstring( FFI::NCurses.LINES-7, col, "Wow, you are #{outputans} year's old, well done!", 10)
     end
     
   end
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

      if ch == FFI::NCurses::KEY_RETURN && "#{dob}" != ''
       
        
    def destroyuserprofile 
        
    win = Window.new
    win.printstring(10,10, "Thank you #{name}! your user profile has been created!");
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
end
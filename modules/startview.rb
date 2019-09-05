module Startview
def displayprofilemenu
    
     alist = ["Devin", "Simon", "Paul"]
     alist = []
      (1..50).each do |i|
        alist << "#{i} entry"
      end
       box = Box.new row: 1,col: 4, height: -5, width: 40, title: "User Profiles", justify: :left
       lb = Listbox.new list: alist
       box.add lb
       form.add_widget lb, box
       form.pack
       form.select_first_field
       win.wrefresh
    end
end
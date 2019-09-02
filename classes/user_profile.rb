require_relative "../modules/addprofile"
require_relative "../modules/viewprofile"

class Userprofile
    attr_accessor :name, :weight, :height, :dob, :createdat    
    def initialize(name, weight, height, dob, createdat)
    @name = name 
    @weight = weight 
    @height = height
    @dob = dob 
    @createdat = createdat
    end
    include Addprofile 
    include Viewprofile
end

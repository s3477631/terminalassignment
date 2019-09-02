require_relative "../modules/addprofile"
require_relative "../modules/viewprofile"

class Userprofile
    attr_accessor :name, :weight, :height, :dob   
    def initialize(name, weight, height, dob)
    @name = name 
    @weight = weight 
    @height = height
    @dob = dob 
    end
    include Addprofile 
    include Viewprofile
end

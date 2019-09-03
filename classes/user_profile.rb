require_relative "../modules/addprofile"
require_relative "../modules/viewprofile"
require_relative "../modules/updateprofile"

class Userprofile
    attr_accessor :name, :weight, :height, :dob, :bmidata
    def initialize(name, weight, height, dob)
    @name = name 
    @weight = weight 
    @height = height
    @dob = dob
    bmidata = lambda { weight/(height*height) }
    @bmidata = bmidata.call
    end
    include Updateprofile
    include Addprofile 
    include Viewprofile
end


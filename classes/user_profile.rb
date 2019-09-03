require_relative "../modules/addprofile"
require_relative "../modules/viewprofile"
require_relative "../modules/openprofile"
require_relative "../modules/updateprofile"


class Userprofile
    attr_accessor :name, :weight, :height, :dob, :bmidata, :recordday
    def initialize(name, weight, height, dob)
    @name = name  
    @weight = weight 
    @height = height
    @dob = dob
    bmidata = lambda { (weight/(height*height)).round(2) }
    @bmidata = bmidata.call
    end
    include Addprofile 
    include Viewprofile
    include Updateprofile
end


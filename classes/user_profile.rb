require_relative "../modules/addprofile"
require_relative "../modules/viewprofile"
require_relative "../modules/openprofile"
require_relative "../modules/updateprofile"


class Userprofile
    attr_accessor :name, :weight, :height, :dob, :bmidata
    def initialize(name, weight, height, dob)
    @name = name  
    @weight = weight 
    @height = height
    @dob = dob
    @bmidata = bmidata.call
    bmidata = lambda { weight/(height*height).round(2) }
    end
    include Addprofile 
    include Viewprofile
    include Updateprofile
end


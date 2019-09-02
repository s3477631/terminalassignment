

class Userprofile
    attr_accessor :name, :weight, :height, :dob, :createdat
        
    def initialize(name, weight, height, dob, createdat)
    @name = name 
    @weight = weight 
    @height = height
    @dob = dob 
    @createdat = createdat
    end
    def addprofile 
        Dir.mkdir("#{name}")
    end
    def viewProfile
        return  puts "#{name}"
    end
    def removeProfile
    end
end

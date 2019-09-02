class Userprofile
    attr_reader :name, :weight, :height, :dob, :createdat
        
    def initialize(name, weight, height, dob, createdat)
    @name = name 
    @weight = weight 
    @height = height
    @dob = dob 
    @createdat = createdat
    end
    def profileName
        return  puts "#{name}"
    end
end

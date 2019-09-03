require 'fileutils'
module Viewprofile
    def viewprofile  
        file_data = File.read("#{Date.today}.txt")
        output = file_data.split(' ')
    end
end

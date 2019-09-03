require 'fileutils'
module Viewprofile
    attr_accessor :output
    def viewprofile  
        file_data = File.read("#{Date.today}.txt")
        output = file_data.split(' ')
        puts "#{output}"
    end
end

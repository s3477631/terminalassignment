require 'fileutils'
module Viewprofile
    attr_accessor :output, :recorddday
    def viewprofile  
        file_data = File.read("#{readindex}.txt")
        output = file_data.split(' ')
        puts "#{output}"
    end
end

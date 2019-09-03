require 'fileutils'
module Viewprofile
    attr_accessor :output, :recorddday
    def viewprofile  
        readindex = (recorddday.to_i)
        @readindex = 1 ? readindex = 1 : readindex - 1
        puts readindex
        file_data = File.read("#{readindex}.txt")
        output = file_data.split(' ')
        puts "#{output}"
    end
end

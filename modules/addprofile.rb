require 'fileutils'
require 'date'

module Addprofile 
def addprofile
    FileUtils.mkdir_p "USER_PROFILES/#{name}"
    FileUtils.cd "USER_PROFILES/#{name}"
    FileUtils.touch "userdata.txt"
    File.open "userdata.txt", "w"
    File.write("userdata.txt", "#{weight}, #{height}, #{dob}, #{bmidata}")
end
end
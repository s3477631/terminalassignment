require 'fileutils'
require 'date'

module Addprofile
def addprofile 
    FileUtils.mkdir_p "USER_PROFILES/#{name}"
    FileUtils.cd "USER_PROFILES/#{name}"
    FileUtils.touch "#{Date.today}.txt"
    File.open "#{Date.today}.txt", "w"
    File.write("#{Date.today}.txt", "#{weight}, #{height}, #{dob}")
end
end
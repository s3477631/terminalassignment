require 'fileutils'
require 'date'

module Addprofile
def addprofile 
    FileUtils.mkdir_p "USER_PROFILES/#{name}"
    FileUtils.cd "USER_PROFILES/#{name}"
    FileUtils.touch "#{Date.today}.rb"
    File.open "#{Date.today}.rb", "w"
    File.write("#{Date.today}.rb", "#{weight}, #{height}, #{dob}")
end
end
require 'fileutils'
require 'date'

module Addprofile
def addprofile

    FileUtils.mkdir_p "USER_PROFILES/#{name}"
    FileUtils.cd "USER_PROFILES/#{name}"
    recordedday = (`ls -1 #{name} | wc -l`.to_i) + 1
    FileUtils.touch "#{recordedday}.txt"
    File.open "#{recordedday}.txt", "w"
    File.write("#{recordedday}.txt", "#{weight}, #{height}, #{dob}, #{bmidata}")
end
end
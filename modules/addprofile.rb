require 'fileutils'

module Addprofile
def addprofile 
    FileUtils.mkdir_p "USER_PROFILES/#{name}"
end
end
require 'fileutils'

module Openprofile
    def signin
        FileUtils.cd("../USER_PROFILES/#{name}")
    end
end
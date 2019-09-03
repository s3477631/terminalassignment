module Updateprofile
    def updateprofile
        FileUtils.cd "USER_PROFILES/#{name}"
        recordedday = (`ls -1 #{name} | wc -l`.to_i)
        @recordedday = recordedday.to_i + 1 
        FileUtils.touch "#{recordedday}.txt"
    end
end

module Updateprofile
    def updateprofile
        FileUtils.cd "USER_PROFILES/#{name}"
        File.open('userdata.txt', 'a') do |f|
            f << "#{weight}, #{height}, #{dob}, #{bmidata}"
          end

    end
end

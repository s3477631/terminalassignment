require_relative "user_profile"
require_relative "../modules/updateprofile"

class Bmi < Userprofile
    include Updateprofile
end


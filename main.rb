require_relative "./classes/user_profile"
require_relative "./classes/bmi_calculator"


test = Userprofile.new("John", 80, 1.88, "17/03/1932")
test.addprofile
test.updateprofile
test.viewprofile
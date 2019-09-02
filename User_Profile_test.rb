require 'test/unit'
require_relative 'user_profile'


class UserProfile < Test::Unit::TestCase
    def setup
        @userpro = Userprofile.new("John", 80, 180, '17/06/1992', '02/09/2019')
    end
    def test_name_create
        assert_equal('02/09/2019', @userpro.createdat)
    end
end
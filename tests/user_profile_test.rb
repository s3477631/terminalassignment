require 'test/unit'
require_relative '../classes/user_profile'


class UserProfile < Test::Unit::TestCase
    def setup
        @userpro = Userprofile.new("Thomas", 80, 180, '17/06/1992', '02/09/2019')
    end
    def test_name_input
        assert_equal('Thomas', @userpro.name)
    end
    def test_weight_input
        assert_equal(80, @userpro.weight)
    end
    def test_height_input
        assert_equal(180, @userpro.height)
    end
    def test_dob_input
        assert_equal('17/06/1992', @userpro.dob)
    end
    def test_createdat_input
        assert_equal('02/09/2019', @userpro.createdat)
    end
    def test_add_profile
        assert_equal('Thomas', @userpro.addprofile)
    end

end


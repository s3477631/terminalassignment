require_relative "./classes/user_profile"

require 'fileutils'

puts "Hello, Please Enter Your Name"
nameinput = gets.chomp

if File.directory?("./USER_PROFILES/#{nameinput}")
    puts "Welcome Back!"
else 
    puts "would you like to sign up?"

    if nameinput == ''
        puts "Please enter name to register profile: "
        name = gets.chomp
        puts "Please enter weight in kilograms" 
        weight = gets.chomp.to_f
        puts "Please enter height in metres squared i.e: 1.70"
        height = gets.chomp.to_f
        puts "Please enter date of birth"
        dob = gets.chomp
        test = Userprofile.new(name, weight, height, dob)
        test.addprofile
    else 
        
        @name = nameinput  
        puts "Please enter the weight you recorded today" 
        @weight = gets.chomp.to_f 
        @height = height
        @dob = dob
        test2 = Userprofile.new(name, weight, height, dob)
        
        
    end

end







# Your job is to build a program that will help them manage their cookie baking. 
# Here are a few user stories to help get you started:

# As a baker, I want to make different types of cookies (peanut butter, chocolate chip, etc.).
# As a baker, I want to place batches of cookies in an oven.
# As a baker, I want to know when a batch of cookies is ready to be removed from the oven.
# Think about this problem critically before you even begin to write code 
# and describe how you would design the program in plain English.

# Think about this problem critically before you even begin to write code and describe how you would design the program in plain English.

# At the very least, consider these questions in your answer:

# What are essential classes?
# What attributes will each class have?
# What interface will each class provide?
# How will the classes interact with each other?
# Which classes will inherit from others, if any?

#It does not need to track multiple types of cookies, 
#but you should be able to move cookies into and out of an oven.

# Add more features to your program.

# Multiple types of cookies, each with a different baking time
# Status attribute for cookies, with at least these possible values: :doughy, :almost_ready, :ready, :burned

require "timeout"

class Cookies

	attr_reader :cookie_types,:ready_in,:cookie_attributues

	def initialize
		@cookie_attributues = ['Doughy','Almost ready','Ready','Burned']
	end

end

class Cookies_attributes < Cookies
	attr_reader :doughy, :almost_ready, :ready, :burned
end

class Butter < Cookies

	def initialize
		@cookie_types = "butter"
		@ready_in = 4
	end

end

class Chocolate < Cookies

	def initialize
		@cookie_types = "chocolate"
		@ready_in = 8
	end

end

class Vanilla < Cookies

	def initialize
		@cookie_types = "vanilla"
		@ready_in = 12
	end

end

cookies = Cookies.new
butter = Butter.new
chocolate = Chocolate.new
vanilla = Vanilla.new

while true

	puts "Please Choose Your Cookies Type"
	puts "Butter type : 1"
	puts "Chocolate type : 2"
	puts "Vanilla type : 3"

	cookies_input_type = gets.chomp
	cookies_input_type = cookies_input_type.to_i

	if cookies_input_type != 1 && cookies_input_type != 2 && cookies_input_type != 3
		puts ""
		puts "Wrong number"
		puts ""
		next
	else
		#puts "correct number"

		if cookies_input_type == 1 
			ready_in_mins = butter.ready_in
			puts ""
			puts "Pushing #{butter.cookie_types.capitalize} into the oven!"
		elsif cookies_input_type == 2
			ready_in_mins = chocolate.ready_in
			puts ""
			puts "Pushing #{chocolate.cookie_types.capitalize} into the oven!"
		elsif cookies_input_type == 3
			ready_in_mins = vanilla.ready_in
			puts ""
			puts "Pushing #{chocolate.cookie_types.capitalize} into the oven!"
		end

		puts "Your Cookies will ready in #{ready_in_mins} mins!"

		user_pull_cookies = false
		fulltime_countdown = ready_in_mins
		cookies_atr = cookies.cookie_attributues

		until user_pull_cookies == true 
			puts "Sec #{ready_in_mins}"
			if ready_in_mins == fulltime_countdown / 2
				puts "Your Cookies is #{cookies_atr[0]}"
				#sleep 1
			elsif ready_in_mins == fulltime_countdown / 4
				puts "Your Cookies is #{cookies_atr[1]}"
				#sleep 1
			elsif ready_in_mins == 0
				puts "Your Cookies is #{cookies_atr[2]} Please Enter to pull out"
				
				begin
				  Timeout::timeout 3 do
				    user_check = gets.chomp
				    user_pull_cookies = true
				  end
				rescue Timeout::Error
				  #ans = nil
				  ready_in_mins -= 1
				  next
				end
				# sleep 
			elsif ready_in_mins <= -1
				puts "Your Cookies is #{cookies_atr[3]} Please Enter pull it out now!"
				user_check = gets.chomp
				user_pull_cookies = true
			end

			ready_in_mins -= 1

			sleep 1

		end

	end
	puts "Cookies is derivered"
	puts ""
	#puts cookies_input_type

end

def destroy_message(string)
	#TODO: return the part a string without the message
	check_list = /[:]/

 	if string =~ check_list
		stringConvert = string.partition(":").first
		test = stringConvert + ":"
		return test
	else 
		return string
	end
end

def destroy_message!(string)
	#TODO: remove the message from string destructively!
	check_list = /[:]/

	if string =~ check_list
		string.gsub!(/[^:]*$/, "")
	end
end

# Driver code... 
string = "this message will self-destruct: you can't hug every cat"
original_string = string.dup
puts "1"
puts destroy_message(string) == "this message will self-destruct:"
puts "2"
puts string == original_string # we shouldn't modify the string passed to destroy_message

string = "this has no message"
original_string = string.dup
puts "3"
puts destroy_message(string)
puts destroy_message(string) == string
puts "4"
puts string == original_string # we shouldn't modify the string passed to destroy_message

string = "this message will self-destruct: you can't hug every cat"
original_string = string.dup
destroy_message!(string)
puts "5"
puts string == "this message will self-destruct:"
puts "6"
puts string != original_string

string = "this has no message"
result = destroy_message!(string)
puts "7"
puts result.nil?
puts "8"
puts string == string
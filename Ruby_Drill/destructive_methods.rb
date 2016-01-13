# <p>You will be writing two versions of a method called <code>destroy_message</code> which takes in a string identified by the variable <code>message</code> and modifies that string based upon the following rules:</p>

#
# A message is a string that may or may not contain a :
# If the original message contains a : then all content after (but not including) 
# the : is removed when the message self-destructs. 
# So if the original message is
# "This message will self destruct: Ruby is fun ""
# then the destructed message is "This message will self destruct:"
# If the original message does not contain a : then it will not change in when it is destructed.
# 
class String

	def destroy_message!
		check_list = /[^:]/

		if self =~ check_list
			# test = self.partition(":").first
			# self.partition(":").first
			self.gsub!(/[^:]*$/, "")
		else
			
		end
		
	end
end

message = "This message will self destruct: Ruby is fun"

puts message

message.destroy_message!()

puts message

class RPNCalculator

	def evaluate(sentence)
		array = sentence.split(" ")

		converted_array = []
		number_regex = /[0-9]/
		number_stack = []
		opr_stack = []

		if array.length <= 2
			puts "false"
			return false
		else
			array.each { |x|
				if number_regex =~ x
					#puts "numberrr"
					number_stack.insert(0,x.to_i)
					#print number_stack
					#puts ""
				else
					#puts "no num ber"
					temp_opr = x.to_s
					result_opr = number_stack[1].to_i.send(temp_opr,number_stack[0].to_i)

					number_stack.delete_at(0)
					number_stack.delete_at(0)
					number_stack.insert(0,result_opr)
				end
			}

		end

		print number_stack
		puts ""
		
	end

end

calc = RPNCalculator.new

calc.evaluate("1 2 +") # => 3
calc.evaluate("2 5 *") # => 10
calc.evaluate("50 20 -") # => 30

calc.evaluate("70 10 4 + 5 * -") # => 0

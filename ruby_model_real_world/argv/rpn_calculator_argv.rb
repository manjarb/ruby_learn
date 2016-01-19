class RPNCalculator

	def evaluate(sentence)
		array = sentence[0].split(" ")

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
					puts "numberrr"
					number_stack.insert(0,x.to_i)
					print number_stack
					puts ""
				else
					puts "no num ber"
					temp_opr = x.to_s
					result_opr = number_stack[1].to_i.send(temp_opr,number_stack[0].to_i)

					number_stack.delete_at(0)
					number_stack.delete_at(0)
					number_stack.insert(0,result_opr)
					print number_stack
					puts ""

				end
			}

		end
		
	end

end

calc = RPNCalculator.new

calc.evaluate(ARGV)

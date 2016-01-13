def linear_search(number,array)
	result = nil
	for i in 0..array.length-1
		if number == array[i]
			result = i
			return result
		end

	end

	return result

end

random_numbers = [6, 29, 18, 2, 72, 19, 18, 10, 37]
puts linear_search(18, random_numbers)
# => 2
puts linear_search(9, random_numbers)
# => nil

def global_linear_search(letter,array)
	result = []
	for i in 0..array.length-1
		if letter == array[i]
			result << i
		end
	end

	return result
end

# Write a new method global_linear_search that returns an array of all the indices for the object it searches for. In other words, if the object x is in more than one place in the array, global_linear_search will return an array containing the index of each occurrence of x.

bananas_arr = "bananas".split(//)
# => ["b", "a", "n", "a", "n", "a", "s"]
print global_linear_search("a", bananas_arr)
puts ""
# => [1, 3, 5]
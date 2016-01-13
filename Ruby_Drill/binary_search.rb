# Array.prototype.binarySearch = function(find) {
#   var low = 0, high = this.length - 1,
#       i, comparison;
#   while (low <= high) {
#     i = Math.floor((low + high) / 2);
#     if (this[i] < find) { low = i + 1; continue; };
#     if (this[i] > find) { high = i - 1; continue; };
#     return i;
#   }
#   return null;
# };

def binary_search(number,array)
	low = 0
	high = array.length - 1
	i = 0

	while low <= high
		i = ((low + high) / 2).floor

		if array[i] < number
			low = i + 1
			next
		end

		if array[i] > number
			high = i - 1
			next
		end

		return i
	end

	return false

end


test_array = (100..200).to_a
puts binary_search(155, test_array) == 55
# => true

test_array = [13, 19, 24, 29, 32, 37, 43]
puts binary_search(35, test_array) == false
# => true
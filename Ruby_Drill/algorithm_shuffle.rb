# -- To shuffle an array a of n elements (indices 0..n-1):
# for i from 0 to n − 1 do
#       j ← random integer such that 0 ≤ j ≤ i
#       if j ≠ i
#           a[i] ← a[j]
#       a[j] ← source[i]


def shuffle(array)
  	# Implement the shuffle method-
  	used_position = []
  	newArray = []

  	for i in 0..array.length-1
  		j = Random.rand(10)
  		used_array_check = true

  		if i == 0
  			newArray << array[j]
  			used_position << j
  		else
  			while used_array_check == true
  				j = Random.rand(10)
  				used_array_check = false
  				used_position.each { |usedPos|
  					if usedPos == j
  						used_array_check = true
  					end
  				}
  				
  			end
  			newArray << array[j]
  			used_position << j

  		end

	end
	print newArray
	puts ""
end


# Driver code:
sorted_array = (1..10).to_a

# This should print a different sequence of numbers each time
shuffle(sorted_array)
shuffle(sorted_array)
shuffle(sorted_array)
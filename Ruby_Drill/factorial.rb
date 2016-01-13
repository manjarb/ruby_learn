# function factorial is:
# input: integer n such that n >= 0
# output: [n × (n-1) × (n-2) × … × 1]

#     1. create new variable called running_total with a value of 1

#     2. begin loop
#           1. if n is 0, exit loop
#           2. set running_total to (running_total × n)
#           3. decrement n
#           4. repeat loop

#     3. return running_total

# end factorial


# Implement an iterative version of the factorial function
def factorial_iterative(n)
	running_total = 1 

	for i in 0..n
		if n == 0
			break
		end

		running_total = running_total * n
		n = n - 1
	end

	return running_total

end

puts factorial_iterative(30) == 265252859812191058636308480000000

# function factorial is:
# input: integer n such that n >= 0
# output: [n × (n-1) × (n-2) × … × 1]

#     1. if n is 0, return 1
#     2. otherwise, return [ n × factorial(n-1) ]

# end factorial

# Implement a recursive version of the factorial function
def factorial_recursive(n)
	if n <= 0
		return 1 
	else
		return n * factorial_recursive(n - 1)
	end
end

puts factorial_recursive(30) == 265252859812191058636308480000000
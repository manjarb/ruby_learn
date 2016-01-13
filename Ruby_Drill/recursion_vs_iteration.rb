require 'benchmark' 

def fibonacci_iterative(n)
	first = 0
	second = 1
	current_loop = 1

	while current_loop <= n
		k = first
		first = second
		second = k + second
		current_loop = current_loop + 1
	end

	return first

end

#puts fibonacci_iterative(30)

def fibonacci_recursive(n)
	return n if n <= 1
	fibonacci_recursive(n - 1) + fibonacci_recursive(n - 2)
end

#puts fibonacci_recursive(30)

puts Benchmark.measure { fibonacci_iterative(30) }
puts Benchmark.measure { fibonacci_recursive(30) }
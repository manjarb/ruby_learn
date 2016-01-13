def prime_factors(n)
  prime_array = []    
  p = 2
  if n < 2
      return p
  end

  while p < n
    if n % p == 0
      prime_array.push(p)
    end
    p +=1
  end

  return prime_array
end

puts ""
print prime_factors(3) # => [3]
puts ""
print prime_factors(6) # => [2,3]
puts ""
print prime_factors(8) # => [2,2,2]
puts ""
print prime_factors(25) # => [5,5]
puts ""
print prime_factors(123123123) # => [3, 3, 41, 333667]
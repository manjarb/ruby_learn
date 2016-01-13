def canonical(word)
	word.downcase!
	return word.chars.sort.join
end

def is_anagram?(word1,word2) 
	return canonical(word1) == canonical(word2)
end

# The method should be symmetric, i.e.,
# is_anagram?(word1, word2) == is_anagram?(word2, word1) for any two words
puts is_anagram?('cinema', 'iceman') # => true
puts is_anagram?('iceman', 'cinema') # => true

# Pedantically, a word is always an anagram of itself.
# This is called being "reflexive," i.e., is_anagram?(word, word) == true for any word
puts is_anagram?('pants', 'pants') # => true

# is_anagram? should be case-insensitive
puts is_anagram?('CiNemA', 'iceman') # => true

# Notice: acres, cares, and scare are all anagrams of each other
puts is_anagram?('acres', 'cares') # => true
puts is_anagram?('cares', 'scare') # => true
puts is_anagram?('scare', 'acres') # => true

# The "words" don't need to be valid English words
puts is_anagram?('abcde2', 'c2abed') # => true

puts is_anagram?('pants', 'turtle') # => false
puts is_anagram?('123123', 'kjhasd') # => false
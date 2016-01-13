def canonical(word)
	word = word.downcase
	return word.chars.sort.join
end

def is_anagram?(word1,word2) 
	return canonical(word1) == canonical(word2)
end

def anagrams_for(word,dictionary)

	word.downcase!
	result = []

	dictionary.each { |x|
		result << x if is_anagram?(word,x)
	}

	return result

end



# The dictionary is just an arbitrary collection of strings.
# It need not contain English words, e.g., 'etlsm'.
dictionary = ['acres', 'cares', 'Cesar', 'races', 'smelt', 'melts', 'etlsm']

# If the input word happens to be in the dictionary, it should be in the the returned array, too.
# The list should also be case-insensitive.

puts anagrams_for('acres', dictionary) == ['acres', 'cares', 'Cesar', 'races'] # => ['acres', 'cares', 'Cesar', 'races']

puts anagrams_for('ACRES', dictionary) == ['acres', 'cares', 'Cesar', 'races'] # => ['acres', 'cares', 'Cesar', 'races']

puts anagrams_for('Cesar', dictionary) == ['acres', 'cares', 'Cesar', 'races'] # => ['acres', 'cares', 'Cesar', 'races']

# # Although "sacre" is not *in* the dictionary, several words in the dictionary are anagrams of "sacre"
puts anagrams_for('sacre', dictionary) == ['acres', 'cares', 'Cesar', 'races'] # => ['acres', 'cares', 'Cesar', 'races']

# # Neither the input word nor the words in the dictionary need to be valid English words
puts anagrams_for('etlsm', dictionary) == ['smelt', 'melts', 'etlsm'] # => ['smelt', 'melts', 'etlsm']

puts anagrams_for('unicorn', dictionary) == [] # => []


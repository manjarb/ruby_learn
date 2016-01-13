# Script: CONVERT TO PIG LATIN

# Iteration One: CONVERT SINGLE WORD

# GET a word from user input
# IF the word starts with a vowel, don't change it
# ELSE replace the word with its pig latin equivalent
#   GET all of the consonants before the first vowel in the word
#   SET the consonants at the end of the word and add the suffix "ay"
# ENDIF
# PRINT the pig-latin-ified word

puts "Please put your word"
word = gets.chomp
$number_convert = 0

def convertPigLatin(word)
	vowel_list = /[aeiou]/
	letter_list = /\b([bcdfghjklmnprstvwxyz]|qu)+/

	if word[0] =~ vowel_list
	
	else
		$number_convert = $number_convert + 1
		firtConsonant = word.match(letter_list)
		word = "#{word}-#{firtConsonant}-ay"
	end

	return word
end

puts convertPigLatin(word)

# Iteration Two: CONVERT COMPLETE SENTENCE

# GET a sentence from user input
# FOR each word in the sentence
#   CONVERT SINGLE WORD
# ENDFOR
# PRINT the converted sentence
# DISPLAY the number of words converted

puts "Please put your word2"
word2 = gets.chomp
$number_convert = 0

sentenceArray = word2.split(" ")

sentenceArray.map! { |x|
	x = convertPigLatin(x)
}

puts sentenceArray.join(' ').capitalize << "."
puts "#{$number_convert} converted"













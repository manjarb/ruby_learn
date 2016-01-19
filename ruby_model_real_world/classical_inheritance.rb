#Define 7 empty classes: Animal Mammal, Amphibian, Primate, Frog, Bat, and Chimpanzee.

# Set up an inheritance structure that makes sense given the phylogenetic position of the animal in relation to the others.

# Add some properties

# Add instance variables and methods to your different classes. These could include things like @num_legs or warm_blooded?. Make up your own.

# The write a script to prove that your inheritance structure works. If you assign @num_legs = 2 in the Primate class, does an instance of Chimpanzee have the same variable and value?

# Hint: you may have to define some reader methods.

# Extra Credit: Super powers with a Module

# This objective is really just for fun.

# Create a module SuperPowers with some crazy (and perfectly useless) features like a use_laser_vision method and a magic_points reader and writer method.

# Then use your module as a mixin for one or more of your classes.

class Animal

	def initialize
		
	end
end

class Mammal < Animal
	def initialize
		@warm_blooded = true
		@num_legs = 6
	end
end

class Amphibian < Animal
	attr_reader :num_legs2
	def initialize
		@warm_blooded = false
		@num_legs2 = 20
	end
	def test
		puts "test 33"
	end
end

class Primate < Animal
	def initialize
		@warm_blooded = true
	end
end

class Frog < Amphibian

	def initialize
		#@num_legs = 4
		@num_legs2 = 30
	end
end

class Bat < Primate
	def initialize
		@num_legs = 2
	end
end

class Chimpanzee < Mammal
	def initialize
		@num_legs = 2
	end
end

frog = Frog.new

puts frog.num_legs2
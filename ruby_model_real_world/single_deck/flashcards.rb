# Main file for 
class CardData
	def initialize(file)
		#@file = file
		temp_hash = {}
		@array_question = []
		i = 1
		File.open(file, "r") do |f|
		  f.each_line do |line|
		  	if line != "\n"
		  		if i.even?
		  			temp_hash["answer"] = line.gsub("\n","")
		  			@array_question << temp_hash
		  			temp_hash = {}
		  		else 
		  			temp_hash["question"] = line.gsub("\n","")
		  		end
		    	i += 1
			end
		  end
		end
	end

	def to_s
		print @array_question
		puts ""
	end

	def running_app
		puts "Welcome Start Game! just type the correct word for each answer!"
		
		for i in 0..@array_question.length - 1
			answer_check = false
			puts ""
			puts "Definition"
			puts @array_question[i]["question"]

			until answer_check == true
				puts ""
				puts "Guess:"
				answer = gets.chomp
				if answer == @array_question[i]["answer"]
					puts "Correct!"
					answer_check = true
				else
					puts "Incorrect try again!"
				end
			end
		end
	end
end

card_data = CardData.new('flashcard_samples.txt')
#card_data.to_s
card_data.running_app
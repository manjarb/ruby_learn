# What classes do you need?

# Remember, there are four high-level responsibilities, each of which have multiple sub-responsibilities:
# 1. Gathering user input and taking the appropriate action (controller)
# 2. Displaying information to the user (view)
# 3. Reading and writing from the todo.txt file (model)
# 4. Manipulating the in-memory objects that model a real-life TODO list (domain-specific model)

# Note that (4) is where the essence of your application lives.
# Pretty much every application in the universe has some version of responsibilities (1), (2), and (3).
require 'csv'

class List
	def initialize(file)
		@file = file
		@tasks = CSV.read(@file)
	end

	def save_file_csv
		CSV.open("todo.csv", "w") do |csv|
	      @tasks.each { |x|
	        csv << x
	      }
	    end
	end

	def add(task)
		task_sentence = [task.task_name_arr.join(" ")]
		#puts task_sentence
		@tasks << task_sentence
		save_file_csv

	    puts "Appended \"#{task_sentence[0]}\" to your todo list"
	end

	def delete(task_number)
		task_index = task_number.to_i - 1
		puts "Delete #{@tasks[task_index][0]} From your todo list"
		@tasks.delete_at(task_index)
		save_file_csv
	end

	def complete(task_number)
		task_index = task_number.to_i - 1
		puts "Complete \"#{@tasks[task_index][0]}\""
		task_complete = "[X] #{@tasks[task_index][0]} "
		@tasks[task_index] = [task_complete]
		save_file_csv
	end

	def tasks
		i = 1
		@tasks.each { |x|
			puts "#{i}. #{x[0]}"
			i += 1
		}

	end
end

class Task
	attr_accessor :task_name_arr
	def initialize(tast_name_arr_input)
		@task_name_arr = tast_name_arr_input
	end
end

list = List.new('todo.csv')
task_name_filter_arr = []

if ARGV[0] == "list"
	list.tasks
elsif ARGV[0] == "add"

	for i in 1..ARGV.length - 1
		task_name_filter_arr << ARGV[i]
	end

	list.add(Task.new(task_name_filter_arr))
elsif ARGV[0] == "delete"
	list.delete(ARGV[1])
elsif ARGV[0] == "complete"
	list.complete(ARGV[1])
end




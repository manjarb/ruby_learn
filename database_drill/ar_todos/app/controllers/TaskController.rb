require_relative '../models/task'

class TaskController
  
	def initialize
		@tasks = Task.new
	end

	def list_all_tasks
		@tasks.show_all
	end

	def add(task)
		# task_sentence = [task.task_name_arr.join(" ")]
		# #puts task_sentence
		# @tasks << task_sentence
		# save_file_csv
		@tasks.add_new_task(task.join(" "))
	    puts "Appended \"#{task.join(" ")}\" to your todo list"
	 	#print task.join(" ")
	end

	def delete(id)
		task_details = @tasks.find_by_id(id)
		@tasks.delete_a_task(id)
		puts "Delete \"#{task_details['sentences']}\" From your todo list"
	end

	def complete(id)
		task_details = @tasks.find_by_id(id)
		task_sentence = task_details['sentences']
		task_complete = "[X] #{task_sentence}"

		@tasks.success_a_task(id,task_complete)

		puts "Complete \"#{task_sentence}\""
		
	end

end

# tasks = TaskController.new
# tasks.list_all_tasks.each { |x|
# 	puts x.attributes
# }
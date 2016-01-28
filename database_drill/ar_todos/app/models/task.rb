require_relative '../../db/config'

class Task < ActiveRecord::Base

	def show_all
		Task.all
	end

	def add_new_task(task)
		Task.create(sentences: task)
	end

	def delete_a_task(task_id)
		task = Task.find_by(id: task_id)
		task.destroy
	end

	def success_a_task(task_id,new_setence)
		task = Task.find_by(id: task_id)
		task.update(sentences: new_setence)
	end

	def find_by_id(task_id)
		Task.find_by(id: task_id)
	end

end

#puts Task.show_all.inspect
require 'csv'

require_relative '../app/models/task'

class TaskSeed
	def self.import(filename)
		csv = CSV.new(File.open(filename))

		csv.each { |x|
			print x[0]
			puts ""
			task_hash = {:sentences => x[0]}

			Task.create!(task_hash)
		}

	end
end

filename = File.dirname(__FILE__) +'/data/todo.csv'
TaskSeed.import(filename)
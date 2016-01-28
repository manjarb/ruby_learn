require_relative 'config/application'
require_relative File.dirname(__FILE__) + '/app/controllers/TaskController.rb'

#puts "Put your application code in #{File.expand_path(__FILE__)}"

tasks = TaskController.new
task_name_filter_arr = []

if ARGV[0] == "list"
	tasks.list_all_tasks.each { |x|
		puts "#{x.attributes['id']}. #{x.attributes['sentences']}"
	}
elsif ARGV[0] == "add"

	for i in 1..ARGV.length - 1
		task_name_filter_arr << ARGV[i]
	end

	tasks.add(task_name_filter_arr)
elsif ARGV[0] == "delete"
	tasks.delete(ARGV[1])
elsif ARGV[0] == "complete"
	tasks.complete(ARGV[1])
end
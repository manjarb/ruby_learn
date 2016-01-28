require_relative '../config'

class CreateTodosTable < ActiveRecord::Migration
	def change
		create_table :tasks do |t|
	    	t.string :sentences
	        # t.datetime :created_at
	        # t.datetime :updated_at
	    end
	end
end
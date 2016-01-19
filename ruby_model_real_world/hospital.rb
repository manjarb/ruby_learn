class Hospital
	attr_reader :location,:number_employees,:number_patients
	attr_writer :login_data
	attr_accessor :employees_details,:patients_details,:janitors_details

	def initialize
		@location = "Bkk"
		@login_data = [
						{
							"username" => "emp01",
							"password" => "1234",
							"role"=> "Employees"
						},
						{
							"username" => "doc01",
							"password" => "1234" ,
							"role"=> "Doctor"
						},
						{
							"username" => "jani01",
							"password" => "1234",
							"role"=> "Janitor" 
						},
						{
							"username" => "admin01",
							"password" => "1234",
							"role"=> "Admin" 
						}
					]
		@employees_details = [
								{
									"id"=> "01",
									"name"=>"John 01",
									"role"=> "Employees"
								},
								{
									"id"=> "02",
									"name"=>"John 02",
									"role"=> "Employees"
								}
							]
		@patients_details = [
								{
									"id"=> "01",
									"name"=> "Pat 01",
									"ages"=> "25",
									"role"=> "Patients"
								},
								{
									"id"=> "02",
									"name"=> "Pat 02",
									"ages"=> "30",
									"role"=> "Patients"
								}
							] 
		@number_employees = employees_details.length
		@number_patients = patients_details.length
	end

	def login_func(username,password)
		login_detect = @login_data.find_all { |x|
			x["username"] == username && x["password"] == password
		}
		if login_detect.length <= 0
			return false
		else
			return login_detect[0]["role"]
		end
		# print login_detect
		# puts ""
	end
end

class Patients < Hospital
	attr_writer :id,:name,:ages

	def initialize
		@hospital = Hospital.new
	end

	def list_patients
		return @hospital.patients_details
	end

	def add_patients(id,name,ages,role)
		@hospital.patients_details << {"id"=> id,"name"=> name,"ages"=> ages,"role"=> role}
	end

	def view_patient_record(id)
		patient_records = @hospital.patients_details.find_all { |x|
			x["id"] == id
		}

		return patient_records[0]

	end

	def delete_patients(id)
		patient_records_index = @hospital.patients_details.find_index { |x|
			x["id"] == id
		}
		@hospital.patients_details.delete_at(patient_records_index)
	end

end

hospital = Hospital.new
patient = Patients.new

puts ""
puts "Welcome to AA Hospital at #{hospital.location}"
puts "-----------------------"
puts "Please enter your username"
username = gets.chomp
puts "Please enter your password"
password = gets.chomp
puts "-----------------------"

admin_process = true

unless hospital.login_func(username,password)
	puts "Your username or password is wrong"
else 

	user_role = hospital.login_func(username,password)
	small_user_role = user_role.downcase

	puts "Welcome, #{username}"
	puts "Your access level is: #{user_role}"
	puts "-----------------------"

	if small_user_role == "janitor"
		puts "Patients List"
		patient.list_patients.each { |x|
			print x['name']
			puts ""
		}
	else

		until admin_process = false

			puts "What would you like to do?"
			puts "Options"
			puts "List patients: press 1"
			puts "View records: press 2"
			puts "Add records: press 3" 
			puts "Remove records: press 4" 

			command = gets.chomp
			if command == "1"
				print patient.list_patients
				puts ""
			elsif command == "2"
				puts "Enter Patient id"
				patient_id = gets.chomp
				print patient.view_patient_record(patient_id)
				puts ""
			elsif command == "3"
				puts "Patient id:"
				id = gets.chomp
				puts "Name:"
				name = gets.chomp
				puts "Age:"
				age = gets.chomp
				role = "Patients"
				patient.add_patients(id,name,age,role)
			elsif command == "4"
				puts "Patient id:"
				id = gets.chomp
				patient.delete_patients(id)
				puts "Delete Success"
			end

		end

	end

end












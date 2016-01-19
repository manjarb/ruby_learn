class Company

  attr_accessor :company_name
  attr_writer :acct_number
  attr_reader :employees
 
  def initialize(name)
    @company_name  = name
    @employees   = []
  end
 
  # def company_name
  #   @company_name
  # end
 
  # def company_name=(new_name)
  #   @company_name = new_name
  # end
 
  def add_employee(employee)
    @employees << employee
  end
 
  # def employees
  #   @employees
  # end
end
 
 
class Employee

  attr_accessor :name,:position
  attr_writer :acct_number
  attr_reader :id
 
  def initialize(name, position)
    @name     = name
    @position = position
    @id       = rand(100_000_000).to_s.insert(2, '-').insert(6, '-')
  end
 
  # def name
  #   @name
  # end
 
  # def name=(new_name)
  #   @name = new_name
  # end
 
  # def position
  #   @position
  # end
 
  # def position=(new_position)
  #   @position = new_position
  # end
 
  # def id
  #   @id
  # end
end
 
code_division = Company.new("Code Division")

josh = Employee.new("Josh", "Master Of The Bootiverse")

code_division.add_employee(josh)

puts (p "#{code_division.company_name} - #{code_division.employees.first.name}: #{code_division.employees.first.position}") == "Code Division - Josh: Master Of The Bootiverse"

josh.name = "Not Cheryl Yeoh"
josh.position = "Master of Everything"

code_division.company_name = "MaGIC"

puts (p "#{code_division.company_name} - #{code_division.employees.first.name}: #{code_division.employees.first.position}") == "MaGIC - Not Cheryl Yeoh: Master of Everything"

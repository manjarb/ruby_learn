# First, make sure you have a copy of the CSV file from the gist. 
#It contains a few hundred rows of random data about people.

# Create a Person class such that each row of the CSV file represents 
#a particular instance of the Person class. What attributes should a Person object have?

# Create a PersonParser class that is initialized with the name of a CSV file. 
#Then use Ruby's built-in CSV class to implement a PersonParser#people method 
#that returns an Array of properly-parsed Persons, based on the data in the CSV file. 
#Say that three times fast.

# Note: CSV is a "built-in" class, but you still need to require it at the top of your program.

require 'csv'
require 'date'

class Person
  # Look at the above CSV file
  # What attributes should a Person object have?
  attr_accessor :id,:first_name,:last_name,:email,:phone,:created_at
  def initialize
    @id = "testAdd"
    @first_name = "Varis"
    @last_name = "Dara"
    @email = "aaa@gmail.ten"
    @phone = "1122334455"
    @created_at = DateTime.parse('2001-02-03T04:05:06+07:00')
  end

  def person_details
    person_arr = [@id,@first_name,@last_name,@email,@phone,@created_at]
    return person_arr
  end

end

class PersonParser
  attr_reader :file
  
  def initialize(file)
    @file = file
    @people = nil
  end
  
  def people
    # If we've already parsed the CSV file, don't parse it again.
    # Remember: @people is +nil+ by default.
    @people = CSV.read(@file)
    print @people
    puts ""
    return @people if @people
    
    # We've never called people before, now parse the CSV file
    # and return an Array of Person objects here.  Save the
    # Array in the @people instance variable.
  end

  def add_person(person)
    @people << person.person_details
  end

  def save
    CSV.open("testCreate.csv", "w") do |csv|
      @people.each { |x|
        csv << x
      }
      # ...
    end
  end
end

parser = PersonParser.new('people.csv')
parser.people
parser.add_person(Person.new)

parser.save

#puts "There are #{parser.people.size} people in the file '#{parser.file}'."
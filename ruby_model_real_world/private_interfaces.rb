class BankAccount

	attr_accessor :customer_name,:type
	attr_writer :acct_number
	#attr_reader :acct_number_hiding

	def initialize(customer_name,type,acct_number)
		@customer_name = customer_name
		@type = type
		@acct_number = acct_number 
	end

	def to_s
		ssn = /\d{3}[^\d]?\d{3}[^\d]/
		acct_number_hiding = @acct_number.gsub(ssn,"XXX-XXX-")
	end

end

my_acct = BankAccount.new("Junipero Serra", "Checking", "347-923-239")
my_acct.to_s

puts my_acct
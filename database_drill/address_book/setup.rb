require 'sqlite3'

# If you want to overwrite your database you will need
# to delete it before running this file
$db = SQLite3::Database.new "address_book.db"

module A
	def self.setup
	    $db.execute(
	    	<<-SQL
		        CREATE TABLE `contacts` (
				  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
				  `first_name` VARCHAR NULL DEFAULT NULL,
				  `last_name` VARCHAR NULL DEFAULT NULL,
				  `phone` INTEGER NULL DEFAULT NULL,
				  `email` VARCHAR NULL DEFAULT NULL
				);

	    		CREATE TABLE `group` (
				  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
				  `name` VARCHAR NULL DEFAULT NULL
				);

	    		CREATE TABLE `contact_group` (
				  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
				  `contact_id` INTEGER NULL DEFAULT NULL,
				  `group_id` INTEGER NULL DEFAULT NULL
				);

	    		ALTER TABLE `contact_group` ADD FOREIGN KEY (contact_id) REFERENCES `contacts` (`id`);
				ALTER TABLE `contact_group` ADD FOREIGN KEY (group_id) REFERENCES `group` (`id`);

		      SQL
	    )
	end
	def self.seed
	    # Add a few records to your database when you start
	    $db.execute(
	      <<-SQL
	        INSERT INTO contacts
	          (first_name, last_name,phone,email)
	        VALUES
	          ('mat','demon',11111111111,'aa@aa.co');

	        INSERT INTO group
	          (name)
	        VALUES
	          ('hubba');

	        -- Create two more students who are at least as cool as this one.
	      SQL
	    )
	  end
	def self.select_all_contacts
		$db.execute(
	    	<<-SQL
		        SELECT * FROM contacts;
		      SQL
	    )
	end
end

class Contact
	def initialize(data)
		@first_name = data['first_name']
		@last_name = data['last_name']
		@phone = data['phone']
		@email = data['email']
	end
	def save
		$db.execute(
	      <<-SQL
	        INSERT INTO contacts
	          (first_name, last_name,phone,email)
	        VALUES
	          ('#{@first_name}','#{@last_name}','#{@phone}','#{@email}');

	        -- Create two more students who are at least as cool as this one.
	      SQL
	    )
	end
	def select_all
		puts $db.execute(
		      <<-SQL
		        SELECT * FROM contacts;

		        -- Create two more students who are at least as cool as this one.
		      SQL
		    )
	end

	def delete(id)
		$db.execute(
	      <<-SQL
	        DELETE FROM contacts WHERE id = "#{id}";

	        -- Create two more students who are at least as cool as this one.
	      SQL
	    )
	end
	def update(id,data)
		first_name = data['first_name']
		last_name = data['last_name']
		phone = data['phone']
		email = data['email']

		phone_validate = /(?:\+?|\b)[0-9]{10}\b/
		email_validate = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
		#puts phone

		if phone_validate =~ phone.to_s && email =~ email_validate
			$db.execute(
		      <<-SQL
		        UPDATE contacts SET first_name = '#{first_name}', last_name = '#{last_name}', phone = '#{phone}', email = '#{email}' WHERE id = "#{id}";

		        -- Create two more students who are at least as cool as this one.
		      SQL
		    )
		else
			puts "phone or email wrong format"
			
		end
	end
end

contact_info = {'first_name'=>'aoeui','last_name'=>'qjkjk','phone'=>11111111111,'email'=>'oo@oo.co'}
contact = Contact.new(contact_info)
#contact.save
#contact.select_all
#contact.delete(3)
contact_update = {'first_name'=>'update_test','last_name'=>'sure_test','phone'=>1111112222,'email'=>'jareo@ee.ro'}
contact.update(4,contact_update)
contact.select_all








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
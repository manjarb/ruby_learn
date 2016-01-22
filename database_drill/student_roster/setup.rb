require 'sqlite3'

# If you want to overwrite your database you will need
# to delete it before running this file
$db = SQLite3::Database.new "students.db"

module StudentDB
  def self.setup
    $db.execute(
      <<-SQL
        CREATE TABLE students (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          first_name VARCHAR(64) NOT NULL,
          last_name VARCHAR(64) NOT NULL,

          -- add the additional attributes here!

          created_at DATETIME NOT NULL,
          updated_at DATETIME NOT NULL
        );
      SQL
    )
  end

  def self.seed
    # Add a few records to your database when you start
    $db.execute(
      <<-SQL
        INSERT INTO students
          (first_name, last_name, created_at, updated_at)
        VALUES
          ('Brick','Thornton',DATETIME('now'), DATETIME('now'));

        -- Create two more students who are at least as cool as this one.
      SQL
    )
  end

  def self.select_all
    $db.execute(
      <<-SQL
       SELECT * FROM students;
      SQL
    )
  end
  def self.add_a_student(data)
    $db.execute(
      <<-SQL
       INSERT INTO students (first_name, last_name, created_at, updated_at) VALUES ("#{data[0]}","#{data[1]}",DATETIME('now'), DATETIME('now')); 
      SQL
    )
  end
  def self.delete_a_student(student_id)
    $db.execute(
      <<-SQL
       DELETE FROM students WHERE id = "#{student_id}";
      SQL
    )
  end
  def self.select_a_student_by_name(name)
    $db.execute(
      <<-SQL
       SELECT * FROM students WHERE first_name = "#{name}";
      SQL
    )
  end
end
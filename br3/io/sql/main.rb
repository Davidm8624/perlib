require 'sqlite3'
$db = SQLite3::Database.new("dbfile")
$db.results_as_hash = true #its not a good idea to make your db a global variable in real application, we make it use a hash rather then return as csv becasue it easier to use

#some sql test stuff

#puts "its all okay!" if defined?(SQLite3::Database)

#CREATE TABLE people(
#id integer primary key,
#name varchar(50),
#job varchar(50),
#gender varchar(6),
#age integer
#);

#INSERT INTO people (name, age, gender, job) VALUES ("Chris Scott", 25, "Male", "technician");

def disconnect_and_quit
  $db.close
  puts "bye!"
  exit
end

def create_table
  puts "Createing a table"
  $db.execute %q{
    CREATE TABLE people(
    id integer primary key,
    name varchar(50),
    job varchar(50),
    gender varchar(6),
    age integer
    )
  }
end

def add_entry
  puts "enter name:"
  name = gets.chomp
  puts "enter job"
  job = gets.chomp
  puts "enter gender"
  gender = gets.chomp
  puts "enter age"
  age = gets.chomp
  $db.execute("INSERT INTO people (name, job, gender, age) VALUES (?, ?, ?, ?)"),
  name, job, gender, age)
end

require 'sqlite3'
$db = SQLite3::Database.new('dbfile')
$db.results_as_hash = true # its not a good idea to make your db a global variable in real application, we make it use a hash rather then return as csv becasue it easier to use

# some sql test stuff

# puts "its all okay!" if defined?(SQLite3::Database)

# CREATE TABLE people(
# id integer primary key,
# name varchar(50),
# job varchar(50),
# gender varchar(6),
# age integer
# );

# INSERT INTO people (name, age, gender, job) VALUES ("Chris Scott", 25, "Male", "technician");

def disconnect_and_quit
  $db.close
  Rails.logger.debug 'bye!'
  exit
end

def create_table
  Rails.logger.debug 'Createing a table'
  $db.execute '
    CREATE TABLE people(
    id integer primary key,
    name varchar(50),
    job varchar(50),
    gender varchar(6),
    age integer
    )
  '
end

def add_entry
  Rails.logger.debug 'enter name'
  name = gets.chomp
  Rails.logger.debug 'enter job'
  job = gets.chomp
  Rails.logger.debug 'enter gender'
  gender = gets.chomp
  Rails.logger.debug 'enter age'
  age = gets.chomp
  $db.execute('INSERT INTO people (name, job, gender, age) VALUES (?, ?, ?, ?)',
              name, job, gender, age)
end

def find_entry
  Rails.logger.debug 'Enter name of id of a person'
  id = gets.chomp
  person = $db.execute('SELECT * FROM people WHERE name = ? OR id = ?', id, id.to_i).first

  unless person
    Rails.logger.debug 'no result found'
    return
  end

  Rails.logger.debug do
    %(Name: #{person['name']}
  Job: #{person['job']}
  Gender: #{person['gender']}
  Age: #{person['age']})
  end
end

loop do
  Rails.logger.debug do
    'Please select and option:
  1. create table
  2. add and entry
  3. find an entry
  4. quit'
  end

  case gets.chomp
  when '1'
    create_table
  when '2'
    add_entry
  when '3'
    find_entry
  when '4'
    disconnect_and_quit
  end
end

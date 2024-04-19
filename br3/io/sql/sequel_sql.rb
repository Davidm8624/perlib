# yes theres a difference
require 'sequel'
require 'pg'

DB = Sequel.connect('postgres://user:password@localhost/dbname')

DB.create_table :people do
  primary_key :id
  String :first_name
  String :last_name
  Integer :age
end

people = DB[:people]
people.insert(:first_name => "name1", :last_name => "name1 part 2", age => "1")

puts "there are #{people.count} people in the db"

people.each do |person|
  puts person [:first_name]
end

Db.fetch("SELECT * FROM people") do |row|
  puts row[:first_name]
end

require 'yaml'

class Person
  attr_accessor :name, :job, :gender, :age
end

fred = Person.new
fred.name = 'Fred Bloggs'
fred.age = 45

laura = Person.new
laura.name = 'Laura Smith'
laura.age = 23
test_data = [fred, laura]

puts test_data.to_yaml

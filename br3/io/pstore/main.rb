class Person
  attr_accessor :name, :job, :gender, :age
end

fred = Person.new
fred.name = "Fred Bloggs"
fred.age = 45

laura = Person.new
laura.name = "Laura Smith"
laura.age = 23

require 'pstore'
store = PStore.new("storagefile")
store.transaction do
  store[:people] ||= Array.new
  store[:people] << fred
  store[:people] << laura
end
# thanks to the above the 2 people are now stored to disk in hash format so that we can later use them

# now we are interacting with the people without talking to to temp stored fred/laura but rather the fred/laura hash that is saved in storagefile
people = []
store.transaction do
  people = store[:people]
end

people.each do |person|
  puts person.name
end

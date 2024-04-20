# how to make a custom error output

class Person
  attr_accessor :name

  def initialize(name)
    @name = name
    return unless name.empty?

    raise ArgumentError, 'no name presentt'
  end
end

p1 = Person.new('bob')
puts p1.name
p2 = Person.new('')
puts p1.name

# handler

begin
  puts 10 / 0 # cant divide by 0 error
rescue StandardError => e
  puts "there was an error: #{e.class}"
end

# catch & throw

catch(:finish) do
  1000.times do
    x = rand(1000)
    throw :finish if x = 69
  end

  puts 'was able to generate 1000 num without getting 69'
end

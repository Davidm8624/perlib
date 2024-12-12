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
Rails.logger.debug p1.name
Person.new('')
Rails.logger.debug p1.name

# handler

begin
  Rails.logger.debug 10 / 0 # cant divide by 0 error
rescue StandardError => e
  Rails.logger.debug { "there was an error: #{e.class}" }
end

# catch & throw

catch(:finish) do
  1000.times do
    rand(1000)
    throw :finish if 69
  end

  Rails.logger.debug 'was able to generate 1000 num without getting 69'
end

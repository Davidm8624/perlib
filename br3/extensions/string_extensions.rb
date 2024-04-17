# this will add some new methods to STRING that can be used in other programs

class String
  def vowels
    self.scan(/[aeiou]/i)
  end
end

class BookInStock
  attr_reader :isbn, :price

  def initialize(isbn, price)
    @isbn = isbn
    @price = FLOAT(price)
  end

  def price_in_cents
    (price * 100).round
  end
end

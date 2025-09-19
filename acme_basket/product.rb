# I will create a class Product that has three attributes: code, name, and price.
# The price should be a float.
# The class should have a to_s method that returns a string representation of the product.
# The string representation should be in the format: "name (code) - $price"
module AcmeBasket
  class Product
    attr_reader :code, :name, :price

    def initialize(code:, name:, price:)
      @code  = code
      @name  = name
      @price = price.to_f
    end

    def to_s
      "#{name} (#{code}) - $#{'%.2f' % price}"
    end
  end
end
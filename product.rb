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
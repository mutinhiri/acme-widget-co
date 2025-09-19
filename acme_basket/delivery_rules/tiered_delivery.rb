# I will create a class TieredDelivery that has one attribute: rules.
# The rules attribute should be an array of hashes where each hash has two keys: limit and cost.
# The limit key should be a float and the cost key should be a float.
# The class should have an apply method that takes a subtotal as an argument and returns the delivery fee.
module AcmeBasket
  class TieredDelivery
    def initialize(rules)
      # rules is an array like: [{ limit: 50, cost: 4.95 }, { limit: 90, cost: 2.95 }]
      @rules = rules
    end

    def apply(subtotal)
      @rules.each do |rule|
        return rule[:cost] if subtotal < rule[:limit]
      end
      0
    end
  end
end

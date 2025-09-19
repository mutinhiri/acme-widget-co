# I will create a class Basket that has three attributes: catalog, delivery_rules, and offers.
# The catalog should be a ProductCatalog object.
# The delivery_rules should be an array of DeliveryRule objects.
# The offers should be an array of Offer objects.
# The class should have a total method that returns the total cost of the basket.
# The total cost should include the subtotal, discounts, and delivery fees.
module AcmeBasket
  class Basket
    def initialize(catalog:, delivery_rules:, offers:)
      @catalog        = catalog
      @delivery_rules = delivery_rules
      @offers         = offers
      @items          = []
    end

    def add(code)
      product = @catalog.find(code)
      raise "Unknown product code: #{code}" unless product
      @items.append(product)
    end

    def total
      subtotal = @items.map(&:price).sum
      discount = @offers.map { |o| o.apply(@items) }.sum
      delivery = @delivery_rules.map { |r| r.apply(subtotal - discount) }.max
      (subtotal - discount + delivery).round(2)
    end
  end
end

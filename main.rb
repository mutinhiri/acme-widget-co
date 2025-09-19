# Load classes
require_relative "acme_basket/basket"
require_relative "acme_basket/product"
require_relative "acme_basket/product_catalog"
require_relative "acme_basket/offers/red_widget_offer"
require_relative "acme_basket/delivery_rules/tiered_delivery"


include AcmeBasket

# Define products
products = [
  Product.new(code: "R01", name: "Red Widget", price: 32.95),
  Product.new(code: "G01", name: "Green Widget", price: 24.95),
  Product.new(code: "B01", name: "Blue Widget", price: 7.95)
]

catalog = ProductCatalog.new(products)

# Define delivery rules
delivery_rules = [
  TieredDelivery.new([
    { limit: 50, cost: 4.95 },
    { limit: 90, cost: 2.95 }
  ])
]

# Define offers
offers = [RedWidgetOffer.new]

# Run sample baskets for testing
b1 = Basket.new(catalog: catalog, delivery_rules: delivery_rules, offers: offers)
b1.add("B01")
b1.add("G01")
puts "Basket 1 Total: $#{b1.total}" # => 37.85

b2 = Basket.new(catalog: catalog, delivery_rules: delivery_rules, offers: offers)
b2.add("R01")
b2.add("R01")
puts "Basket 2 Total: $#{b2.total}" # => 54.37

b3 = Basket.new(catalog: catalog, delivery_rules: delivery_rules, offers: offers)
b3.add("R01")
b3.add("G01")
puts "Basket 3 Total: $#{b3.total}" # => 60.85

b4 = Basket.new(catalog: catalog, delivery_rules: delivery_rules, offers: offers)
b4.add("B01")
b4.add("B01")
b4.add("R01")
b4.add("R01")
b4.add("R01")
puts "Basket 4 Total: $#{b4.total}" # => 98.27

# I will create a class ProductCatalog that has one attribute: products.
# The products attribute should be a hash where the keys are product codes and the values are Product objects.
# The class should have a find method that takes a product code as an argument and returns the Product object corresponding to that code.
# The class should have an add method that takes a Product object as an argument and adds it to the products hash.
# The class should have an initialize method that takes an array of Product objects as an argument and adds them to the products hash.
# The initialize method should call the add method for each Product object in the array.
module AcmeBasket
  class ProductCatalog
    def initialize(products = [])
      @products = {}
      products.each { |product| add(product) }
    end

    def add(product)
      @products[product.code] = product
    end

    def find(code)
      @products[code]
    end
  end
end

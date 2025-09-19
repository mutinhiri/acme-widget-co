# I will create a class RedWidgetOffer that has one method: apply.
# The apply method should take an array of Product objects as an argument.
# The apply method should return the total discount for the Red Widget offer.
# The total discount should be the number of Red Widgets in the basket divided by 2, multiplied by the price of a Red Widget divided by 2.
# If there are no Red Widgets in the basket, the apply method should return 0.
module AcmeBasket
  class RedWidgetOffer
    def apply(items)
      reds = items.select { |i| i.code == "R01" }
      return 0 if reds.empty?   

      discount_count = reds.size / 2
      discount_count * (reds.first.price / 2.0)
    end
  end
end

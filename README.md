# acme-widget-co


This project models a basket that calculates totals, applies offers, and calculates delivery charges.

---

## Features

* Add products to a basket by  **product code** .
* Calculate **total price** including:
  * Product prices
  * Special offers (currently: "Buy one Red Widget, get the second half price")
  * Tiered  **delivery charges** :
    * Orders under $50 → $4.95
    * Orders under $90 → $2.95
    * Orders $90 or more → free delivery
* **Extensible design** using strategy patterns for offers and delivery rules.

---

## Installation

Clone the repository:

git clone ``https://github.com/mutinhiri/acme-widget-co``

Run the demo:

```
ruby main.rb
```

---

## Usage

Example baskets:

<pre class="overflow-visible!" data-start="953" data-end="1648"><div class="contain-inline-size rounded-2xl relative bg-token-sidebar-surface-primary"><div class="sticky top-9"><div class="absolute end-0 bottom-0 flex h-9 items-center pe-2"><div class="bg-token-bg-elevated-secondary text-token-text-secondary flex items-center gap-4 rounded-sm px-2 font-sans text-xs"></div></div></div><div class="overflow-y-auto p-4" dir="ltr"><code class="whitespace-pre! language-ruby"><span><span>basket1 = </span><span>Basket</span><span>.new(</span><span>catalog:</span><span> catalog, </span><span>delivery_rules:</span><span> delivery_rules, </span><span>offers:</span><span> offers)
basket1.add(</span><span>"B01"</span><span>)
basket1.add(</span><span>"G01"</span><span>)
puts basket1.total  </span><span># => 37.85</span><span>

basket2 = </span><span>Basket</span><span>.new(</span><span>catalog:</span><span> catalog, </span><span>delivery_rules:</span><span> delivery_rules, </span><span>offers:</span><span> offers)
basket2.add(</span><span>"R01"</span><span>)
basket2.add(</span><span>"R01"</span><span>)
puts basket2.total  </span><span># => 54.37</span><span>

basket3 = </span><span>Basket</span><span>.new(</span><span>catalog:</span><span> catalog, </span><span>delivery_rules:</span><span> delivery_rules, </span><span>offers:</span><span> offers)
basket3.add(</span><span>"R01"</span><span>)
basket3.add(</span><span>"G01"</span><span>)
puts basket3.total  </span><span># => 60.85</span><span>

basket4 = </span><span>Basket</span><span>.new(</span><span>catalog:</span><span> catalog, </span><span>delivery_rules:</span><span> delivery_rules, </span><span>offers:</span><span> offers)
basket4.add(</span><span>"B01"</span><span>)
basket4.add(</span><span>"B01"</span><span>)
basket4.add(</span><span>"R01"</span><span>)
basket4.add(</span><span>"R01"</span><span>)
basket4.add(</span><span>"R01"</span><span>)
puts basket4.total  </span><span># => 98.27</span><span>
</span></span></code></div></div></pre>

---

## Assumptions

1. **Product Catalog**
   * Each product has a unique code, name, and price.
   * Basket only allows products defined in the catalog.
2. **Offers**
   * Currently only "Buy one Red Widget, get second half price".
   * Offers are applied independently and can be extended easily.
3. **Delivery Charges**
   * Only one set of delivery rules is active.
   * Delivery is calculated after applying offers.
4. **Basket Behavior**
   * Multiple identical products are allowed.
   * Totals are rounded to  **two decimal places** .
   * If no offers apply, basket calculates just the subtotal + delivery.

---

## Project Structure

* `main.rb` – demo runner with example baskets.
* `acme_basket/` – all core classes and modules.
* `offers/` – place to add new offer strategies.
* `delivery_rules/` – place to add new delivery strategies.

---

## How it Works

1. **Create a catalog** of products.
2. **Define delivery rules** and offers.
3. **Instantiate a Basket** , passing in the catalog, delivery rules, and offers.
4. **Add products** to the basket using `add(code)`.
5. **Call `total`** to calculate the final total including discounts and delivery.

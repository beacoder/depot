class Cart < ApplicationRecord
  # [18] update: a cart has many associated line items
  has_many :line_items, dependent: :destroy

  # [28] update: add product to cart and increase the quantity
  def add_product(product)
    current_item = line_items.find_by(product_id: product.id)
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(product_id: product.id)
    end
    current_item
  end

  # [41] update: calculate total price for all product in cart
  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end
end

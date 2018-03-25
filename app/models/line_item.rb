class LineItem < ApplicationRecord

  # [81] update: lineitem belongs to order
  belongs_to :order, optional: true
  belongs_to :product, optional: true

  # belongs_to :product
  belongs_to :cart

  # [40] update: calculate total price for one product in cart
  def total_price
    product.price * quantity
  end
end

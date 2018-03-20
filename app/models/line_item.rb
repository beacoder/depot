class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  # [40] update: calculate total price for one product in cart
  def total_price
    product.price * quantity
  end
end

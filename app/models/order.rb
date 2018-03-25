class Order < ApplicationRecord

  # [82] update: an order has many associated line items
  # whenever order is destroyed all line items belonging to it will be destroyed too
  has_many :line_items, dependent: :destroy

  # [69] update: define pay_type mapping enum
  enum pay_type: {
    "Check"          => 0,
    "Credit card"    => 1,
    "Purchase order" => 2
  }

  # [80] update: add validation for Order
  validates :name, :address, :email, presence: true
  validates :pay_type, inclusion: pay_types.keys

  # [83] update: add line items to order from cart
  # set cart_id to nil to prevent item from going poof when cart destroyed
  # add line items into order's line_items collection
  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
end

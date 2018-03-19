class Cart < ApplicationRecord
  # [18] update: a cart has many associated line items
  has_many :line_items, dependent: :destroy
end

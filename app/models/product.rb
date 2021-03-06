class Product < ApplicationRecord

  # [19] update: product might have many line items referencing it
  # declare ensure_not_referenced_by_any_line_item() to be called before product being destroyed
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item

  # [7] update: add validation for Product
  validates :title, :description, :image_url, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true
  validates :image_url, allow_blank: true, format: {
              with: %r{\.(gif|jpg|png)\Z}i,
              message: 'must be a URL for GIF, JPG or PNG image.'
            }

  private

  # [20] update: ensure that there're no line items referencing this product
  def ensure_not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, 'Line Items present')
      throw :abort
    end
  end
end

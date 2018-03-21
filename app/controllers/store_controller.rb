class StoreController < ApplicationController

  # [48] update: include the CurrentCart module
  # declare set_cart() to be called before all StoreController action.
  include CurrentCart
  before_action :set_cart

  def index
    # [10] update: fetch all products in alphabetical order
    @products = Product.order(:title)
  end
end

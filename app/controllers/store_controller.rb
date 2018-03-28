class StoreController < ApplicationController

  # [109] update: skip user authorization check
  skip_before_action :authorize

  # [48] update: include the CurrentCart module
  # declare set_cart() to be called before all StoreController action.
  include CurrentCart
  before_action :set_cart

  def index
    # [10] update: fetch all products in alphabetical order
    # @products = Product.order(:title)

    # [131] update: set locale based on select element value
    if params[:set_locale]
      redirect_to store_index_url(locale: params[:set_locale])
    else
      @products = Product.order(:title)
    end
    # [131] end:
  end
end

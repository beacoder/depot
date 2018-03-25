# [17] update: store :cart_id in session object, create cart if not found in session
# place module under app/controllers/concerns to share common code among controllers
# make set_cart private to avoid being treated as controller action which
# could be accessed directly by clients

module CurrentCart

  private

  def set_cart
    @cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    session[:cart_id] = @cart.id
  end
end

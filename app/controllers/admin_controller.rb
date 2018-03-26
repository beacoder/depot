class AdminController < ApplicationController

  def index

    # [105] update: calculate order count
    @total_orders = Order.count

  end

end

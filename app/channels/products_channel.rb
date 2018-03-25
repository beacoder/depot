class ProductsChannel < ApplicationCable::Channel
  def subscribed
    # [66] update: add subscriber "products" for ProductsChannel
    # app/assets/javascripts/channels/products.coffee will be called when there's activity on ProductsChannel
    stream_from "products"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

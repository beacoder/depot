class ProductsChannel < ApplicationCable::Channel
  def subscribed
    # [66] update: add subscriber "products" for Channel ProductsChannel
    stream_from "products"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

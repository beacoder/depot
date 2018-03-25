App.products = App.cable.subscriptions.create "ProductsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel

    # [68] update: handle messages received on ProductsChannel
    # We look for an HTML element with an ID of main that’s contained within another element with a class of store
    # Replace the HTML contents of that element with the data received from the channel
    $(".store #main").html(data.html)

class OrderMailer < ApplicationMailer

  # [88] update: configure the default from for mail
  default from: 'Sam Ruby <depot@example.com>'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.received.subject
  #
  def received
    # [91] update: send mail after order has been received
    # save order in instance variable, specify mail's subject and send it to order's address
    @order = order
    mail to: order.email, subject: 'Pragmatic Store Order Confirmation'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.shipped.subject
  #
  def shipped
    # [92] update: send mail after order has been shipped
    # save order in instance variable, specify mail's subject and send it to order's address
    @order = order
    mail to: order.email, subject: 'Pragmatic Store Order Shipped'
  end
end

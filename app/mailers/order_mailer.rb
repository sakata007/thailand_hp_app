class OrderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.complete.subject
  #
  # 呼び出すときに、引数argsに送り先のメアドを記述
  def complete(args)
    # 引数を取得
    email = args[:email]
    @total_price = args[:total_price]
    @customer_name = args[:customer_name]
    @customer_shipping_address = args[:customer_shipping_address]
    @customer_delivery_date_and_time = args[:customer_delivery_date_and_time]
    @customer_phone_number = args[:customer_phone_number]
    @order_products = args[:order_products]
    @order_id = args[:order_id]
    
    mail(
      to: email, 
      bcc: 'takeruaruketa@gmail.com', 
      subject: 'Thank you for your order!'
    )
    
  end
end
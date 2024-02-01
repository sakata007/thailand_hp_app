# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/order_mailer/complete
  def complete(args)
    # 引数を取得
    email = args[:email]
    @url  = 'http://localhost:8000/orders'
    # 引数を送り先に当て込む
    mail(to: email, subject: 'Your order has been completed')
  end

end

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
    @url  = 'http://localhost:8000/orders'
    # 引数を送り先に当て込む
    mail(to: email, subject: 'Your order has been completed')
  end
end

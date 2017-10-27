class OrderMailer < ApplicationMailer

  def send_noti order
    @order = order

    mail(
      :to => order.user.email,
      :subject => "Holla! Thank you for your order!"
    )
  end

  def send_admin_noti order
    @order = order
    @users = User.where role: :admin

    mail(
      to: "9m2r.kldx@gmail.com",
      cc: @users.map(&:email),
      subject: "Someone has place an order at your website!"
    )
  end

end

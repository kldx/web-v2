class PaymentMailer < ApplicationMailer

  def send_noti invoice
    @invoice = invoice

    mail(
      :to => invoice.order.user.email,
      :subject => "Holla! Thank you for your payment!"
    )
  end

  def send_admin_noti invoice
    @invoice = invoice
    @users = User.where role: :admin

    mail(
      to: "9m2r.kldx@gmail.com",
      cc: @users.map(&:email),
      subject: "Someone is already make a payment at your website!"
    )
  end

end

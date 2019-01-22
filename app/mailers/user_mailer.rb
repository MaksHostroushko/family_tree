class UserMailer < ApplicationMailer
  def send_mail_to_user(user)
    @user = user
    mail(to: @user.email, subject: 'Order')
  end

  def send_mail_to_admin(user)
    @user = user
    mail(to: 'makshostroyshko@gmail.com', subject: 'Order')
  end
end

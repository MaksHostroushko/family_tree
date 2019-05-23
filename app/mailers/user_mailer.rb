class UserMailer < ApplicationMailer
  def send_mail_to_user(user)
    @user = user
    mail(to: @user.email, subject: 'Order')
  end

  def send_mail_to_admin(user, email)
    @user = user
    @email = email
    mail(to: 'makshostroyshko@gmail.com', subject: 'Order')
  end
end

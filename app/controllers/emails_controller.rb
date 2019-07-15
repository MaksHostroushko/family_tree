class EmailsController < ApplicationController
  def new
    @email = Email.new
  end

  def create
    @user = current_user
    @email = Email.new(email_params)
    if @email.save
      UserMailer.send_mail_to_admin(@user, @email).deliver_now
      redirect_to root_path
      flash[:success] = t('.flash_success')
    else
      redirect_back follback_location: emails_new_path
      flash[:danger] = t('.flash_danger')
    end
  end

  private

  def email_params
    params.require(:email).permit(:body, :email, :user)
  end
end

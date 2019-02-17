class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit]
  # before_action :logged_in_user, only: [:edit, :update]
  # before_action :correct_user,   only: [:edit, :update]

  def index
    @users = User.order(:name).page(params[:page])
    @user = current_user
  end

  def new
    @user = User.new
  end

  def show
    @relatives = @user.relatives
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = t(".welcome") + ", " + "#{@user.name}"
      UserMailer.send_mail_to_user(@user).deliver_now!
      UserMailer.send_mail_to_admin(@user).deliver_now!
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit; end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = t('.edit')
      redirect_to root_path
    else
      render 'edit'
    end
  end
  private

  def user_params
     params.require(:user).permit(:name, :second_name, :email, :password, :password_confirmation, :image, :locale)
   end

   def find_user
     @user = User.find(params[:id])
   end

   # def logged_in_user
   #   unless logged_in?
   #     flash[:danger] = "Please log in."
   #     redirect_to login_url
   #   end
   # end
   #
   #  def correct_user
   #    @user = User.find(params[:id])
   #    redirect_to(root_url) unless current_user?(@user)
   #  end
end

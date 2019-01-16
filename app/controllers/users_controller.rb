class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
      flash[:success] = "User create"
    else
      redirect_to root_url
      flash[:danger] = "Sorry,problem"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "User information update"
      redirect_to @user
    else
      redirect_to 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "User removed"
    redirect_to root_url
  end

private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :maiden_name, :description, :picture, :published)
  end
end

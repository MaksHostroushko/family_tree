class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit]
  # caches_action :index

  def new; end

  def formatted_email
    "#{@name} <#{@email}>"
  end

  def index
    @users = User.order(:name).page(params[:page])
    @user = current_user
    @users = User.search(params[:search]).order(created_at: :asc).page(params[:page]) if params[:search]

    respond_to do |format|
      format.html
      # format.js
      format.json { render json: @users.pluck(:name) } if @users.present?
    end
  end

  def show
    @relatives = @user.relatives.page(params[:page])
  end

  def edit
    @collaborators = @user.collaborators
    # debugger
  end

  def update
    @user = current_user

    if params.dig(:user, :collaborators).present?
      user_params = { collaborators: params.dig(:user, :collaborators)[1..-1] }
    end

    if @user.update!(user_params)
      sign_in @user
      # flash[:success] = "#{@user.collaborators}"
      flash[:success] = t('.edit')
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def add_collaborator
    @user = current_user
    @users = @user.following
  end

  def collaborators
    @user = current_user
    @collaborators = @user.collaborators
    @users = @user.following
  end

  def following
    @title = t(".following")
    @user = User.find(params[:id])
    @users = @user.following
    render 'show_follow'
  end

  def followers
    @title = t(".followers")
    @user = User.find(params[:id])
    @users = @user.followers
    render 'show_follow'
  end

  private

  def user_params
    params.require(:user).permit(:name, :second_name, :email, :password, :password_confirmation, :image, :collaborators)
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

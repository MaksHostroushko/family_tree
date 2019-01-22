class RelativesController < ApplicationController
  before_action :find_relative, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
    @relatives = Relative.all
    @relatives = @relatives.where(id: CategoryRelative.where(category_id: params[:filter]).pluck(:relative_id)) if params[:filter].present?
    @user = current_user
    # @user = User.find(params[:id])
    @relatives = Relative.search(params[:search]).order(created_at: :asc)  if params[:search]
    @relatives = Relative.paginate(page: params[:page], per_page: 9)

    respond_to do |format|
      format.html
      format.js
      format.json { render json: @relatives.pluck(:first_name) }
    end
  end

  def new
    @relative = Relative.new
    @user = current_user
  end

  def create
    @relative = Relative.new(relative_params)
    @user = current_user
    if @relative.save
      redirect_to root_url
      flash[:success] = "Relative create.Admin check your relative"
    else
      render 'new'
      # flash[:danger] = "Sorry,problem"
    end
  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    if @relative.update_attributes(relative_params)
      flash[:success] = "relative information update"
      redirect_to @relative
    else
      redirect_to 'edit'
    end
  end

  def destroy
    @relative.destroy
    flash[:success] = "relative removed"
    redirect_to root_url
  end

private

  def relative_params
    params.require(:relative).permit(:first_name, :second_name, :maiden_name, :description, :image, :published, :born, :family_status, :children)
  end

  def find_relative
    @relative = Relative.find(params[:id])
  end
end

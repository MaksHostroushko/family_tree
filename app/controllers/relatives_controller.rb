class RelativesController < ApplicationController
  before_action :find_relative, only: [:show, :edit, :update, :destroy]
  before_action :correct_user,   only: [:destroy, :edit, :update]

  def index
    @categories = Category.all
    @user = current_user
    @relatives = @user.relatives if @user.present?
    @relatives = @relatives.where(id: CategoryRelative.where(category_id: params[:filter]).pluck(:relative_id)) if params[:filter].present?
    @relatives = Relative.search(params[:search]).order(created_at: :asc)  if params[:search]
    # @user = User.find(params[:id])
    # @relatives = Relative.paginate(page: params[:page]).search(params[:search])
    # @relatives = Relative.paginate(page: params[:page]).where(id: CategoryRelative.where(category_id: params[:filter]).pluck(:relative_id)) if params[:filter].present?

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
    @relative = current_user.relatives.build(relative_params)
    @user = current_user
    if @relative.save
      redirect_to root_url
      flash[:success] = t('.save')
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
      flash[:success] = t('.edit')
      redirect_to @relative
    else
      redirect_to 'edit'
    end
  end

  def destroy
    @relative.destroy
    flash[:success] = t('.remove')
    redirect_to root_url
  end

private

  def relative_params
    params.require(:relative).permit(:first_name, :second_name, :maiden_name, :description, :published, :born, :family_status, :children, {images: []}, {category_ids: []})
  end

  def find_relative
    @relative = Relative.find(params[:id])
  end

  def find_user
    @user = User.find(params[:id])
  end

  def correct_user
    @relative = current_user.relatives.find_by(id: params[:id])
    redirect_to root_url if @relative.nil?
  end
end

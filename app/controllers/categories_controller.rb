class CategoriesController < ApplicationController
  before_action :find_category, only: [:show, :edit, :update, :destroy]
  caches_action :index

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
    @user = current_user
  end

  def create
    @category = current_user.categories.build(category_params)
    @user = current_user
    if @category.save
      redirect_to root_url
      # flash[:success] = t('.save')
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
    if @category.update_attributes(category_params)
      # flash[:success] = t('.edit')
      flash[:success] = t('.edit')
      redirect_to @category
    else
      redirect_to 'edit'
    end
  end

  def destroy
    @category.destroy
    # flash[:success] = t('.remove')
    flash[:success] = t('.delete')
    redirect_to root_url
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def find_category
    @category = Category.find(params[:id])
  end
  #
  # def correct_user
  #   @relative = current_user.relatives.find_by(id: params[:id])
  #   redirect_to root_url if @relative.nil?
  # end
end

class RelativesController < ApplicationController

  def index
    @relatives = Relative.all
  end

  def new
    @relative = Relative.new
  end

  def create
    @relative = Relative.new(relative_params)
    if @relative.save
      redirect_to @relative
      flash[:success] = "relative create"
    else
      redirect_to root_url
      flash[:danger] = "Sorry,problem"
    end
  end

  def show
    @relative = Relative.find(params[:id])
  end

  def edit
    @relative = Relative.find(params[:id])
  end

  def update
    @relative = Relative.find(params[:id])
    if @relative.update_attributes(relative_params)
      flash[:success] = "relative information update"
      redirect_to @relative
    else
      redirect_to 'edit'
    end
  end

  def destroy
    @relative = Relative.find(params[:id])
    @relative.destroy
    flash[:success] = "relative removed"
    redirect_to root_url
  end

private

  def relative_params
    params.require(:relative).permit(:first_name, :second_name, :maiden_name, :description, :image, :published, :born)
  end
end

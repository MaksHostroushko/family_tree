class PagesController < ApplicationController
  def index
    @pages = Page.all.page(params[:page]).per(10)
  end
  def show
    @page = Page.find_by_slug(params[:id])
  end
end

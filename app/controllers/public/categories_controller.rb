class Public::CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end
  
  def search
    @categories = Category.search(params[:keyword])
    @keyword = params[:keyword]
    render "index"
  end

end

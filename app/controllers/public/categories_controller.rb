class Public::CategoriesController < ApplicationController
  efore_action :authenticate_user! 

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

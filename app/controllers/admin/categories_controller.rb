class Admin::CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(category_params)
    @categories = Category.all  
    @category.save
    redirect_to admin_categories_path
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to admin_categories_path
    else
      render :edit
    end
  end
  
  def search
    @categories = Category.search(params[:keyword])
    @keyword = params[:keyword]
    render "index"
  end

  private

  def category_params
    params.require(:category).permit(:procedure_id, :name)
  end

end

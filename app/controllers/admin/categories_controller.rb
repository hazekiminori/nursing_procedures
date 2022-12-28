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
    if @category.save
      redirect_to admin_categories_path, notice: "登録しました"
    else
      render index
    end
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

end

class Public::ProceduresController < ApplicationController
  before_action :authenticate_user!, only:[:edit, :update]
  before_action :ensure_normal_user, only:[:new, :create, :edit, :update]

  def show
    @procedure = Procedure.find(params[:id])
    @procedure_change = ProcedureChange.new
  end

  def new
    @procedure = Procedure.new
  end

  def create
    @procedure = Procedure.new(procedure_params)
    @procedure.user_id = current_user.id
    if @procedure.save
      redirect_to procedure_path(@procedure)
    else
      render :new
    end
  end
  
  def index
    if params[:latest]
      @procedures = Procedure.latest
    elsif params[:old]
      @procedures = Procedure.old
    elsif params[:bookmark_count]
      @procedures = Procedure.bookmark_count
    else
      @procedures = Procedure.all
    end
  end

  def edit
    @procedure = Procedure.find(params[:id])
  end

  def update
    #@category = Category.find(params[:id])
    #@procedure.category_id = @category.id
    @procedure = Procedure.find(params[:id])
    @procedure.update(procedure_params)
    redirect_to procedure_path(@procedure)
  end

  private
  
  def ensure_normal_user
    if current_user.email == 'guest@example.com'
      redirect_to root_path, notice: 'このページを見るためには会員登録が必要です'
    end
  end
  
  def user_confirmation
    @user = User.find(params[:id])
     if @user != current_user
       redirect_to categories_path, notice: '投稿者本人のみ編集可能です'
     end
  end

  def procedure_params
    params.require(:procedure).permit(:category_id, :user_id, :title, :image, :necessity_item, :body)
  end
  
end

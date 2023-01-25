class Public::ProceduresController < ApplicationController

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
    if @procedure.save!
      redirect_to procedure_path(@procedure)
    else
      render :new
    end
  end

  def edit
  end

  def update
    #@category = Category.find(params[:id])
    #@procedure.category_id = @category.id
    @procedure = Procedure.find(params[:id])
    @procedure.update(procedure_params)
    redirect_to procedure_path(@procedure)
  end

  private

  def procedure_params
    params.require(:procedure).permit(:caegory_id, :user_id, :title, :image, :necessity_item, :body)
  end

end

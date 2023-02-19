class Admin::ProceduresController < ApplicationController
  def new
    @procedure = Procedure.new
  end

  def index
    @procedures = Procedure.where(category: params[:category])
  end

  def create
    @procedure = Procedure.new(procedure_params)
    if @procedure.save!
      redirect_to admin_procedure_path(@procedure), notice: '登録が完了しました'
    else
      render :new
    end
  end

  def edit
    @procedure = Procedure.find(params[:id])
  end

  def update
    @procedure = Procedure.find(params[:id])
    @procedure.update(procedure_params)
    redirect_to admin_procedure_path(@procedure.id)
  end

  def show
    @procedure = Procedure.find(params[:id])
    @procedure_change = ProcedureChange.new
  end

  def destroy
    @procedure = Procedure.find(params[:id])
    @procedure.destroy
    redirect_to admin_categories_path
  end

  private

  def procedure_params
    params.require(:procedure).permit(:user_id, :title, :necessity_item, :image, :body, :category_id)
  end
end

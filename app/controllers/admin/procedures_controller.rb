class Admin::ProceduresController < ApplicationController

 def new
   @procedure = Procedure.new
 end

 def index
   @procedures = Procedure.where(category: params[:category])
 end

 def create
   #@categpry = Category.find(params[:id])
   @procedure = Procedure.new(procedure_params)
    @procedure.save
     redirect_to admin_procedure_path(@procedure.id), notice: "登録が完了しました"
 end

 def edit
 end

 def update
   @procedure = Procedure.find(params[:id])
   @procedure.update
   redirect_to admin_procedure_path
 end

 def show
   @procedure = Procedure.find(params[:id])
   @change = Change.new
 end

 def procedure_params
    params.require(:procedure).permit(:title, :necessity_item, :image, :procedure, category_ids: [])
 end

end

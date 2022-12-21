class Admin::ProceduresController < ApplicationController
 
 def new
   @procedure = Procedure.new
 end
 
 def create
   @procedure = Procedure.new
   @procedure.save
   redirect_to admin_procedure_path
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
  
end

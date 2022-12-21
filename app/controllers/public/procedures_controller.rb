class Public::ProceduresController < ApplicationController
  
  def show
    @procedure = Procedure.find(params[:id])
    @change = Change.new
  end
  
  def new
    @procedure = Procedure.new
  end
  
  def create
    @procedure = Procedure.find(params[:id])
    @procedure.save
    redirect_to procedure_path
  end

end

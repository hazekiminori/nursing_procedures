class Admin::ChangesController < ApplicationController
  
  def create
    procedures = procedure.find(params[:procedure_id])
    change = current_user.changes.new(change_params)
    change.procedure_id = procedure.id
    change.save
    redirect_to procedures_path(procedure)
  end
  
  private
  
  def change_params
    params.require(:change).permit(:change, :reason)
    

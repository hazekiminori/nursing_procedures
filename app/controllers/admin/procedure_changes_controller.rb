class Admin::ProcedureChangesController < ApplicationController

  def create
    @procedures = procedure.find(params[:procedure_id])
    @procedure_change = current_user.procedure_changes.new(procedure_change_params)
    @procedure_change.procedure_id = @procedure.id
    @procedure_change.save
    redirect_to procedure_path(@procedure)
  end

  def destroy
    ProcedureChange.find(params[:id]).destroy
    redirect_to procedures_path(params[:procedure_id])
  end

  private

  def change_params
    params.require(:procedure_change).permit(:change, :reason)
  end

end
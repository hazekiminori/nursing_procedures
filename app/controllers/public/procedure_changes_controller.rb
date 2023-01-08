class Public::ProcedureChangesController < ApplicationController

  def create
    @procedure = Procedure.find(params[:procedure_id])
    @procedure_change = current_user.procedure_changes.new(procedure_change_params)
    @procedure_change.procedure_id = @procedure.id
    @procedure_change.save
    redirect_to procedure_path(@procedure)
  end

  def destroy
    Procedure.find(params[:id]).destroy
    redirect_to procedure_path(params[:procedure_id])
  end

  private

  def procedure_change_params
    params.require(:procedure_change).permit(:change, :reason)
  end

end

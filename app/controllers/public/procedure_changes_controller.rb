class Public::ProcedureChangesController < ApplicationController
  before_action :ensure_normal_user, only:[:create, :destroy]

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
  
  def ensure_normal_user
    if resource.email == 'guest@example.com'
      redirect_to root_path, alert: 'ゲストユーザーは削除できません。'
    end
  end

  def procedure_change_params
    params.require(:procedure_change).permit(:change, :reason)
  end

end

class Public::ProcedureChangesController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_normal_user, only: %i[create destroy]

  def create
    @procedure = Procedure.find(params[:procedure_id])
    @procedure_change = current_user.procedure_changes.new(procedure_change_params)
    @procedure_change.procedure_id = @procedure.id
    if @procedure_change.save
      redirect_to procedure_path(@procedure)
    else
      render template: 'public/procedures/show'
    end
  end

  def destroy
    Procedure.find(params[:id]).destroy
    redirect_to procedure_path(params[:procedure_id])
  end

  private

  def ensure_normal_user
    return unless current_user.email == 'guest@example.com'

    redirect_to root_path, notice: 'このページを見るためには会員登録が必要です'
  end

  def procedure_change_params
    params.require(:procedure_change).permit(:change, :reason)
  end
end

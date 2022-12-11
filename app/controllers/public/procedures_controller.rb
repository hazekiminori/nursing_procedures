class Public::ProceduresController < ApplicationController
  
  def show
    @procedure = Procedure.find(params[:id])
    @change = Change.new
  end

end

class Public::ProcedureCategoryRelationsController < ApplicationController
  def add_procedure
    @category = Category.find(params[:category_id])
    procedure = Procedure.find(params[:procedure_id])
    @category.procedures << procedure
    redirect_to category_path, notice: "手順を追加しました。"
  end
end

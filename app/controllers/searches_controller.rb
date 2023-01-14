class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]

    if @range == "Category"
      @categories = Category.looks(params[:search], params[:word])
      render "/searches/search_result"
    else
      @procedures = Procedure.looks(params[:search], params[:word])
      render "/searches/search_result"
    end
  end
end

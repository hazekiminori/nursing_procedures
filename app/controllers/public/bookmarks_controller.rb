class Public::BookmarksController < ApplicationController
  before_action :authenticate_user!

  def index
    @bookmarks = Bookmark.all
  end 
  
  def create
    @procedure = Procedure.find(params[:procedure_id])
    bookmark = current_user.bookmarks.new(procedure_id: @procedure.id)
    #@procedure.bookmarks.new(user_id: current_user.id)
    bookmark.save
    redirect_to procedure_path(@procedure)
  end

  def destroy
    @procedure = Procedure.find(params[:procedure_id])
    bookmark = current_user.bookmarks.find_by(procedure_id: @procedure.id)
    #bookmark = @post.bookmarks.find_by(user_id: current_user.id)
        bookmark.destroy
        redirect_to procedure_path(@procedure)
  end
end

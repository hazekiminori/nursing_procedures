class Public::BookmarksController < ApplicationController
  
  def index
    @bookmarks = Bookmark.all
  end 
  
  def create
    procedure = Procedurs.find(params[:procedure_id])
    bookmark = current_user.bookmarks.new(procedure_id: procedure.id)
    bookmark.save
    redirect_to procedure_path(procedure)
  end

  def destroy
    procedure = Procedure.find(params[:procedure_id])
    bookmark = current_user.bookmarks.find_by(procedure_id: procedure.id)
    bookmark.destroy
    redirect_to procedure_path(procedure)
  end
  
end

class Public::UsersController < ApplicationController

  def edit
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to my_page_path
  end
  
  def mypage
    @bookmarks = Bookmark.where(user_id: current_user.id)
  end

  def show
    @user = current_user
  end
  
  def quit
  end
  
  def withdrawal
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :staff_number)
  end

end

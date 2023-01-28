class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_normal_user

  def edit
    @user = current_user
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
  
  def ensure_normal_user
    if current_user.email == 'guest@example.com'
      redirect_to root_path, notice: 'このページを見るためには会員登録が必要です'
    end
  end
  
  def user_params
    params.require(:user).permit(:name, :staff_number)
  end

end

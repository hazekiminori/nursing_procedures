class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_normal_user

  def edit
    @user = current_user
  end

  def update
    if @user == current_user
       @user.update(user_params)
       redirect_to my_page_path
    else
       redirect_to root_path, notice: '他者のユーザー情報編集はできません'
    end
  end

  def mypage
    @bookmarks = Bookmark.where(user_id: current_user.id)
  end

  def show
    @user = current_user
  end

  def quit; end

  def withdrawal
    if @user == current_user 
       @user.update(is_deleted: true)
       reset_session
       flash[:notice] = '退会処理を実行いたしました'
       redirect_to root_path
    else
       redirect_to root_path, notice: '他者の退会処理はできません'
    end
  end

  private


  def ensure_normal_user
    return unless current_user.email == 'guest@example.com'

    redirect_to root_path, notice: 'このページを見るためには会員登録が必要です'
  end

  def user_params
    params.require(:user).permit(:name, :staff_number)
  end
end

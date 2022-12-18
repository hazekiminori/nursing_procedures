class Public::UsersController < ApplicationController
  
  def edit
  end
  
  def update
    @user = current_user
    @user.update
    redirect_to my_page_path
  end
  
end

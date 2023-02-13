# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]
  #before_action :user_state, only:[:create]

  def adter_sign_out_path_for(resource)
    new_user_session_path
  end

  def after_sign_in_path_for(resource)
    root_path
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end
   

  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to categories_path, notice: 'ゲストユーザーとしてログインしました。'
  end
  
  protected
  
  def configure_sign_in_params
     devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
  end
  
  def user_state
      @user = User.find_by(email: params[:user][:email])
      return if !@user.is_deleted
      if @user.valid_password?(params[:user][:password])
         @user.is_deleted && !false
           redirect_to new_user_registration_path
      end
  end
  
end
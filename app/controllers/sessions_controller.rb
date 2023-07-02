class SessionsController < ApplicationController

  before_action :logged_in, only: :destroy

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user.present? && @user.authenticate(params[:user][:password])
      auth ||= AuthService.new
      token = auth.encrypt_token(@user.id)
      render :json => {
        token: token,
        message: 'login success'
      }, status: 200
    else
      render :json => {
        errors: @user.errors
      }, status: 401
    end
  end

  def destroy
    if @current_user.present?
      render :json => {
        message: 'logout'
      }, status: 200
    else
      render :json => {
        errors: 'user not found'
      }, status: 400
    end
  end
end

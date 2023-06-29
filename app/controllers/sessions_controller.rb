class SessionsController < ApplicationController

  before_action :logged_in, only: :destroy

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user.present? && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      render :json => {
        session: session[:user_id],
        message: 'login success'
      }, status: 200
    else
      render :json => {
        errors: @user.errors
      }, status: 401
    end
  end

  def destroy
    session[:user_id] = nil
    render :json => {
      message: 'logout'
    }, status: 200
  end
end

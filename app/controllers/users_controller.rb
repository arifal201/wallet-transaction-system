class UsersController < ApplicationController

  skip_before_action :logged_in, only: :create

  def create
    @user = User.new(user_params)
    if @user.save
      render :json => {
        data: @user.selected_row,
        message: 'create success'
      }
    else
      render :json => {
        errors: @user.errors
      }
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end

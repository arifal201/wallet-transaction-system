class ApplicationController < ActionController::API

  before_action :logged_in

  def logged_in
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    else
      render :json => {
        errors: 'unauthorized'
      }, status: 401
    end
  end

end

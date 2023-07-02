class ApplicationController < ActionController::API

  before_action :logged_in
  include Response

  def logged_in
    if request.headers['Authorization'].present?
      auth = AuthService.new
      if auth.decrypt_token_and_verify(request.headers['Authorization'])
        @current_user = auth.decrypt_token_and_verify(request.headers['Authorization'])
      else
        render :json => {
          errors: 'unauthorized'
        },status: 401
      end
    else
      render :json => {
        errors: 'unauthorized'
      }, status: 401
    end
  end

end

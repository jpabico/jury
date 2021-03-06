class ApplicationController < ActionController::Base
  protect_from_forgery

  # current_user helper for Google omniauth
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end

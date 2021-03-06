class SessionsController < ApplicationController

  def create
    @user = User.find_by_user_name(params["user_name"])
    if @user
      if @user.password == params[:password]
          session[:id] = @user.id
          redirect_to dashboard_path
      else
          redirect_to dashboard_path
      end
    else
      redirect_to dashboard_path
    end
  end

  def destroy
    reset_session
    redirect_to dashboard_path
  end

  def current_user
    @current_user ||= User.find(session[:user_id])
  end

end

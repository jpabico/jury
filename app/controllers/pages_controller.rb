class PagesController < ApplicationController

  def main
    @user = User.new
  end

  def dashboard
    if session[:id]
  	  @target_user = User.find(session[:id])
      @my_cases = User.find(session[:id]).cases.order('status').order('created_at')
      @my_invites = User.find(session[:id]).cases.where(status: "pending")
    end
      @active_cases = Case.where(status: "active")
      @closed_cases = Case.where(status: "closed")
  end

end

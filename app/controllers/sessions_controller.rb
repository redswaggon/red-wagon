class SessionsController < ApplicationController
  # skip_before_action :require_login, :only => [:new, :create]
  
  def new
  end

  def create
    login(params[:username])
    redirect_to user_path(username: params[:username])
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
# OAUTH FACEBOOK
  # def create
  #   user = User.from_omniauth(request.env["omniauth.auth"])
  #   session[:user_id] = user.id
  #   redirect_to root_url
  # end
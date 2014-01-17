class SessionsController < ApplicationController
  skip_before_action :require_login, :only => [:new, :create]
  
  def new
  end

  def create
    auth = request.env["omniauth.auth"]
    user = (User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.from_omniauth(auth))
    session[:user_id] = user.id
    session[:username] = user.username
    redirect_to edit_user_path(user), notice: "Signed in!"
  end

  def destroy 
    session[:username] = nil
    reset_session
    redirect_to root_url, notice: "Signed out!"
  end

end
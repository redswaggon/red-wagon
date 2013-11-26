class SessionsController < ApplicationController
  skip_before_action :require_login, :only => [:new, :create]
  
  def new
  end

  # def create
  #   user = User.find_by(username: params[:username])
  #   if user && user.authenticate(params[:password])
  #     login(user.username)
  #     redirect_to user_path(user)
  #   else
  #     render :new
  #   end
  # end
  
# OAUTH FACEBOOK
  def create
    auth = request.env["omniauth.auth"]
    user = (User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.from_omniauth(auth))
    session[:user_id] = user.id
    redirect_to user_path(user), notice: "Signed in!"
  end

  def destroy 
    session[:username] = nil
    reset_session
    redirect_to new_session_path, notice: "Signed out!"
  end

end
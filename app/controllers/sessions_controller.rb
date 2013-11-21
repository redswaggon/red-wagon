class SessionsController < ApplicationController
  skip_before_action :require_login, :only => [:new, :create]
  
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      login(user.username)
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy 
    session[:username] = nil
    reset_session
    redirect_to root_path
  end

end


# OAUTH FACEBOOK
  # def create
  #   user = User.from_omniauth(request.env["omniauth.auth"])
  #   session[:user_id] = user.id
  #   redirect_to root_url
  # end


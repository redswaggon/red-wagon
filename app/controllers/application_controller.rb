class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :require_login

  def login(username)
    session[:username] = username
  end
  # Custom Auth
  # def require_login
  #   redirect_to new_session_path unless !!current_user
  # end

  def logged_in?
    !!current_user
  end
  helper_method :logged_in?

  def current_user
    @current_user ||= User.find_by(:username => session[:username]) if session[:username]
  end
  helper_method :current_user

  private
  def require_login
    redirect_to root_path unless !!current_user
  end
end

  # OMNIAUTH STUFF
  # before_filter :require_login


  # def current_user
  #   @current_user ||= User.find(session[:user_id]) if session[:user_id]
  # end
  # helper_method :current_user

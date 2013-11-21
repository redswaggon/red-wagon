class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def login(username)
    session[:username] = username
  end

  def require_login
    redirect_to 'sessions#new' unless !!current_user
  end

  def logged_in?
    !!current_user
  end
  helper_method :logged_in?

  def current_user
    user ||= User.find_by(:username => session[:username]) if session[:username]
    @current_user = user.authenticate(password)
  end
  helper_method :current_user

end

  # OMNIAUTH STUFF
  # before_filter :require_login

  # private
  # def require_login
  #   redirect_to root_path unless !!current_user
  # end

  # def current_user
  #   @current_user ||= User.find(session[:user_id]) if session[:user_id]
  # end
  # helper_method :current_user

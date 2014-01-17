class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :require_login
  helper_method :logged_in?
  helper_method :current_user

  def login(username)
    session[:username] = username
  end

  def require_login
    redirect_to root_url unless !!current_user
  end

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find_by(:id => session[:user_id]) if session[:user_id]
  end
end

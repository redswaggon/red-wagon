class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :show, :show_wagon, :update, :destroy]
  # before_action :check_user, except: [:show_wagon]

  def index
    @users = User.all
  end

  def edit
  end

  def new
    @user = User.new
  end

  def create
    if (@user = User.create(user_params))
      @user.neighborhoods = [Neighborhood.find(params[:user][:neighborhoods])]
      @user.save!
      login(@user.username)
      redirect_to @user
    else
      render "users/error"
    end
  end

  def show
  end

  def show_wagon
    # we have @user and params[:username] of another wagon
    # Find all users in his hoods.
    # Picks a random person and displays that person's wagon
  end

  def update
    if @user.update_attributes(user_params)
      @user.neighborhoods = [Neighborhood.find(params[:user][:neighborhoods])]
      @user.save!
      redirect_to @user
    else
      render "users/error"
    end
    # @item = User.items.find(params[:item_id])
  end

  def destroy
    @user.destroy
    redirect_to root_url
  end

  private

  def check_user
    redirect_to error_path unless session[:user_id] == params[:username]
  end

  def set_user
    @user = User.find_by(username: params[:username])
  end

  def user_params
    params.require(:user).permit(:name, :username, :email)
  end

end

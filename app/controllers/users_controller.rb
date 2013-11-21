class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :show, :show_wagon, :update, :destroy]
  # before_action :check_user, except: [:show_wagon]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    if (@user = User.create(user_params))
      @user.neighborhoods = [Neighborhood.find(params[:user][:neighborhoods])]
      5.times {@user.items.build(name: "Click to add")}
      @user.save!
      login(@user.username)
      redirect_to @user
    else
      render "users/error"
    end
  end

  def show_wagon
    if wagons_nearby.empty?
      render "error2"
    else
      @stranger = wagons_nearby[rand(0..@user.neighborhoods.first.users.size-2)] 
    end
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

  def show
  end

  def edit
  end

  private

  def wagons_nearby
    @user.neighborhoods.first.users.reject {|u| @user == u}
  end

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

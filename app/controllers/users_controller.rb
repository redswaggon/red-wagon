class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :show, :random_wagon_nearby, :update, :destroy]
  skip_before_action :require_login, only: [:new, :create]
  before_action :check_user, except: [:index, :new, :create, :show_limited_wagon]

  def index
    if logged_in?
      redirect_to user_path(current_user)
    else
      redirect_to new_session_path
    end
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

  def random_wagon_nearby
    if wagons_nearby.empty?
      render "error2"
    else
      @stranger = wagons_nearby[rand(0..@user.neighborhoods.first.users.size-2)] 
    end
  end

  def show_limited_wagon
    
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
    redirect_to error_path unless session[:username] == params[:username]
  end

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:name, :username, :email, :password, :password_digest, :password_confirmation)
  end

end

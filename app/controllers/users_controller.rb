class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create, :error, :error2]
  before_action :set_user, only: [:edit, :show, :random_wagon_nearby, :update, :destroy]
  before_action :check_user, except: [:index, :new, :create, :show_limited_wagon]

  def index
    if logged_in?
      redirect_to user_path(current_user)
    else
      redirect_to root_url
    end
  end

  def new
    @user = User.new
  end

  def create
    if (@user = User.build(user_params))
      @user.neighborhoods = [Neighborhood.find(params[:neighborhood][:neighborhoods])]
      5.times {@user.items.build}
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
      choose_stranger 
    end
  end

  def show_limited_wagon
    # Link to another user's wagon, only if they've liked you
  end

  def update
    if @user.update_attributes(username: user_params[:username], email: user_params[:email])
      @user.neighborhoods = [Neighborhood.find(params[:neighborhood][:neighborhoods])]
      @user.save!
      redirect_to @user
    else
      render "users/error"
    end
  end

  def destroy
    @user.destroy
    redirect_to root_url
  end

  def show
  end

  def edit
  end

  def error
    # NEXT STEPS: MAKE THE ERROR A FLASH NOTICE IN INDEX
  end

  def error2
    # TURN INTO FLASH NOTICE
  end

  private

  def wagons_nearby
    @user.neighborhoods.first.users.reject {|user| (@user == user) || user.empty_wagon? }
  end

  def choose_stranger
    wagons_to_choose_from = wagons_nearby
    @stranger = wagons_to_choose_from[rand(0..wagons_to_choose_from.size-1)]
  end

  def check_user
    redirect_to error_path unless current_user.username == params[:username]
  end

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:name, :username, :email, :password, :password_digest, :password_confirmation)
  end

end

class UsersController < ApplicationController
  # skip_before_action :require_login
  before_action :set_user, only: [:edit, :create, :show, :swaggon, :update, :destroy]

  def index
  end

  def edit
  end

  def new
    @user = User.new
  end

  def create
    if @user.create(user_params)
      @user.neighborhoods = [Neighborhood.find(params[:user][:neighborhoods])]
      @user.save!
      redirect_to @user
    else
      render "users/error"
    end
  end

  def show
  end

  def swaggon
    # we have @user and params[:username] of another wagon
    # Find all users in his hoods.
    # Picks a random person and displays that person's wagon
  end

  def 

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

  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end

end

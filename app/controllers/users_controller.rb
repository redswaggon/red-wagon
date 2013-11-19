class UsersController < ApplicationController
  # skip_before_action :require_login

  def index
    5.times do 
      current_user.items.build
    end if current_user
  end

  def edit
  end

  def create
    @item = User.items.build
  end

  def show
    # accepts a param with id
  end

  def update
    if current_user.update_attributes(user_params)
      current_user.neighborhoods = [Neighborhood.find(params[:user][:neighborhoods])]
      current_user.save!
      redirect_to root_path
    else
      render "can't update"
    end
    # @item = User.items.find(params[:item_id])
  end

  def destroy
    @item.destroy
    redirect_to users_path
  end

  private

  def item_params
    params[:item]
  end

  def user_params
    params.require(:user).permit(:name,:items,:email)
  end

  def item_params
    params.require(:item).permit(:name,:photo)
  end

end

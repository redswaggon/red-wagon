class ItemsController < ApplicationController
  before_action :set_item, only: [:update, :edit, :success]
  
  def edit
    @user = User.find_by(username: params[:username])
  end

  def update
    @user = User.find(item_params[:user_id])
    @item.update_attributes(item_params)
    @item.save
    redirect_to success_path(@item)
  end

  def success

  end

  # def create
  #   @user = User.find_by(id: item_params[:user_id])
  #   @user.items.build(item_params)
  #   @user.save
  #   @item = @user.items.last
  #   item = {
  #     name: @item.name,
  #     photo_url: @item.photo.url.to_s,
  #     user_id: @item.user_id
  #   }
  #   render json: @item
  # end

  def destroy
    set_item.destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :photo, :user_id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end

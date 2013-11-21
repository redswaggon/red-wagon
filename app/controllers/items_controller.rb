class ItemsController < ApplicationController
  before_action :set_item, only: [:update, :edit, :success, :destroy]
  before_action :set_user, only: [:update, :edit, :destroy]

  def edit
    render layout: false
  end

  def update
    @user = User.find(item_params[:user_id])
    @item.update_attributes(item_params)
    @item.save
    redirect_to success_path(@item)
  end

  def success
    render layout: false
  end

  def destroy
    @item.photo = nil
    @item.name = "click to upload image"
    redirect_to @user
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

  def set_user
    @user = User.find_by(username: params[:username])
  end

end

class ItemsController < ApplicationController

  def create
    @user = User.find_by(id: item_params[:user_id])
    @user.items.build(item_params)
    @user.save
    @item = @user.items.last
    item = {
      name: @item.name,
      photo: @item.photo,
      user_id: @item.user_id
    }
    render json: @item
  end

  def update
    @user = User.find_by(id: item_params[:user_id])
    @user.items.each do |item|
      item.update_attributes(item_params)
    end
    @user.save
    @item = @user.items.last
    item = {
      name: @item.name,
      photo: @item.photo,
      user_id: @item.user_id
    }
    render json: @item
  end

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

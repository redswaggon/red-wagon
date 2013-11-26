class ItemsController < ApplicationController
  before_action :set_item, only: [:update, :edit, :success, :default]
  before_action :set_user, only: [:update, :edit]

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

  def default
    @item.photo = nil
    @item.save
    item = {
      photo_url: "/assets/missing.png"
    }
    render json: item
  end

  def destroy
    set_item.destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :photo, :user_id, :description)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_user
    @user = User.find_by(username: params[:username])
  end

end

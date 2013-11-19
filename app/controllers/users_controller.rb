class UsersController < ApplicationController
  before_action :set_user
  skip_before_action :require_login, :only => :index

  def index
    @items = User.items
  end

  def edit
    @item = User.items.find(params[:item_id])
  end

  def create
    @item = User.items.build
  end

  # def update
  #   @item = User.items.find(params[:item_id])
  # end

  def destroy
    @item.destroy
    redirect_to users_path
  end

  private

  def item_params
    params[:item]
  end

  def set_user
    @user = current_user
  end

end

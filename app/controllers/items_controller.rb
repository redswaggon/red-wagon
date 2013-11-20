class ItemsController < ApplicationController

  def create
    if @item = Item.create(item_params)

      redirect_to root_path
      # render json: @item
    end
  end

  def update
    if @item.update_attributes(item_params)
      redirect_to root_path
      # render json: @item
    else 
      # send some sort of error via ajax?
    end
  end

  def destroy
    set_item.destroy.save
  end

  private

  def item_params
    params.require(:item).include(:name, :photo)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end

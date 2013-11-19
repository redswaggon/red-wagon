class ItemsController < ApplicationController
  def update
    set_item
    if @item.update_attributes(item_params)
      render json: @item
    else 
      # send some sort of error via ajax?
    end
  end

  def create
    if @item = Item.create(item_params)
      render json: @item
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

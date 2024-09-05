class ItemsController < ApplicationController
  def idex
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_parameter)
    redirect_to root_path
  end

  private

  def item_parameter
    params.require(:item).permit(
    :name, :explanation, :category_id,
    :condition_id, :fee_id, :prefecture_id,
    :period_id, :price)
  end


end

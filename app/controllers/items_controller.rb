class ItemsController < ApplicationController
  def idex
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_parameter)
    if @item.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  private

  def item_parameter
    params.require(:item).permit(
    :name, :explanation, :category_id,
    :condition_id, :fee_id, :prefecture_id,
    :period_id, :price)
  end


end

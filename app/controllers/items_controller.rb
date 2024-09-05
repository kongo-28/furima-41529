class ItemsController < ApplicationController
  def idex
  end

  def new
    @item = Item.new
  end

end

class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :user_check, only: [:edit, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
    @item_count = Item.count
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_parameter)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_parameter)
      redirect_to item_path(@item.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.delete
    redirect_to root_path
  end

  private

  def item_parameter
    params.require(:item).permit(
      :name, :image, :explanation, :category_id,
      :condition_id, :fee_id, :prefecture_id,
      :period_id, :price
    ).merge(user_id: current_user[:id])
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def user_check
    if @item.user != current_user
      redirect_to root_path
    end
  end
end

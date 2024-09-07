class OrdersController < ApplicationController

  def index
    @order = OrderForm.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order = OrderForm.new(order_params)
    if @order.save
      redirect_to root_path
    else
      render :create, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order).permit(
      :post_code, :prefecture_id, :municipality, 
      :street_address, :building, :phone_number,
      ).merge(:item_id)
  end
end

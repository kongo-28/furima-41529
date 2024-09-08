class OrdersController < ApplicationController

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order = OrderForm.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order = OrderForm.new(order_params)
    @item = Item.find(params[:item_id])
    binding.pry
    if @order.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
      
      @order.save
      return redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_form).permit(
      :post_code, :prefecture_id, :municipality, 
      :street_address, :building, :phone_number,
    ).merge(
      user_id: current_user.id, item_id: params[:item_id],
      token: params[:token]
    )
  end
end

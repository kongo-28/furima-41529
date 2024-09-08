class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :sold_judge, only: [:index]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order = OrderForm.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order = OrderForm.new(order_params)
    @item = Item.find(params[:item_id])
    if @order.valid?
      pay_item
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

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def sold_judge
    @item = Item.find(params[:item_id])
    if @item.order != nil
      redirect_to root_path
    end
  end
  
end

class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
    if current_user == @item.user || @item.order.present?
      redirect_to root_path
    end
  end 

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :street, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token], price: @item.price)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order_params[:price],  
      card: order_params[:token],   
      currency: 'jpy'                 
     )
  end
end

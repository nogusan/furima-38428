class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :item_params, only: [:index, :create]

  def index
    @order_ship_address = OrderShipAddress.new
  end

  def create
    @order_ship_address = OrderShipAddress.new(order_ship_address_params)
    if @order_ship_address.valid?
      @order_ship_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def item_params
    @item = Item.find(params[:item_id])
  end

  def order_ship_address_params
    params.require(:order_ship_address).permit(:post, :city, :line, :build_name, :tell, :delivery_id).merge(user_id: current_user.id, item_id: @item.id)
  end
end


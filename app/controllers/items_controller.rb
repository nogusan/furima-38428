class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :item_action, except: [:index, :new, :create]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :content, :price, :categoly_id, :status_id, :payer_id, :delivery_id, :place_id,
                                 :image).merge(user_id: current_user.id)
  end

  def item_action
    @item = Item.find(params[:id])
  end
end

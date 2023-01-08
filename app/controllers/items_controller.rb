class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :item_action, except: [:index, :new, :create]
  before_action :contributor_confirmation, only: [:edit, :destroy]
  before_action :already_solid_out, only: :edit

  def index
    @items = Item.all.order('created_at DESC')
    @orders = Order.includes(:item)
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
    @order = Order.where(item_id: @item.id).each { |o| o }
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :content, :price, :categoly_id, :status_id, :payer_id, :delivery_id, :place_id,
                                 :image).merge(user_id: current_user.id)
  end

  def item_action
    @item = Item.find(params[:id])
  end

  def contributor_confirmation
    redirect_to root_path unless current_user == @item.user
  end

  def already_solid_out
    order = Order.where(item_id: @item.id).each { |o| o }
    redirect_to root_path if order != []
  end
end

class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @address = Address.find(params[:id])
  end

  def confirm
    
  end

  def thanks
  end

  def create
  end

  def index
    @orders = Order.all
    @items = Item.all
  end

  def show
    @order = Order.find(params[:id])
    @item = Item.find(params[:id])
    @cart_item = CartItem.find(params[:id])
  end
end

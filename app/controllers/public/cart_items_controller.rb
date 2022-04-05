class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
  end

  def update
  end

  def delete
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    
  end

  def alldelete
    @cart_items = CartItem.all
    @cart_items.destroy_all
  end

  def create
    Item.find_by(item:"")
  end
end

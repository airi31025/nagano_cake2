class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items.all
    @total = 0
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)

    redirect_to public_cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to public_cart_items_path

  end

  def alldelete
    @cart_items = CartItem.all
    @cart_items.destroy_all
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_items = current_customer.cart_items.all
    if nil != @cart_items.find_by(item_id: params[:cart_item][:item_id])
      @cart_item_u = @cart_items.find_by(item_id: params[:cart_item][:item_id])
      new_amount = @cart_item.amount + @cart_item_u.amount
      @cart_item_u.update_attribute(:amount, new_amount)
      @cart_item.delete
    end
    @cart_item.save
    redirect_to public_cart_items_path

  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id,:amount)
  end

end

class Public::OrdersController < ApplicationController
  def new
    @order = Order.new

  end

  def confirm
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    @total = 0
    @order.shipping_cost =800
    if params[:order][:select_address] == '0' then
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name+current_customer.first_name
    elsif params[:order][:select_address] == '1' then
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    else
      new_address = Address.new
      new_address.customer_id = current_customer.id
      new_address.name = params[:order][:name]
      new_address.postal_code = params[:order][:postal_code]
      new_address.address = params[:order][:address]
      new_address.save
      @order.name = params[:order][:name]
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
    end

  end

  def thanks
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.shipping_cost = 800
    @order.status = "waiting_for_deposit"
    @order.save
current_customer.cart_items.each do |cart_item|
    @order_detail = OrderDetail.new
    @order_detail.item_id = cart_item.item_id
    @order_detail.amount = cart_item.amount
    @order_detail.order_id = @order.id
    @order_detail.save

    cart_item.destroy
  end
    redirect_to public_orders_thanks_path
  end

  def index
    @orders = Order.all
    @items = Item.all
  end

  def show
    @order = Order.find(params[:id])

    @order_details = @order.order_details
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :total_payment)
  end

end

class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @customer = Customer.find(params[:id])
    @order_details = OrderDetail.all
    @total = 0
  end

  def update
  end

end
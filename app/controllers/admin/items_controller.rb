class Admin::ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_params)
    list.save
    redirect_to admin_item_path(@item.id)
  end

  def show
     @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
  end

  private
  def item_params
    params.require(:item).permit(:title, :body, :image, :genre, :price)
  end
end

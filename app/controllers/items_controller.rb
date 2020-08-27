class ItemsController < ApplicationController
  def index  
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(tweet_params)
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:picture, :product_name, :product_description, :product_category, :product_status, :burden, :area, :days, :selling_prise, :user)
  end


end

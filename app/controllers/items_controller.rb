class ItemsController < ApplicationController
  before_action :authenticate_user! , except: [:index]
  def index  
    @items = Item.all
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
    params.require(:item).permit( :image, :product_name, :product_description, :product_category_id, :Product_status_id, :burden_id, :area_id, :days_id, :selling_prise).merge(user_id: current_user.id)
  end

end

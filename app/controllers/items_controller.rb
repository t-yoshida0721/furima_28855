class ItemsController < ApplicationController

  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :authenticate_user! , except: [:index,:show]
  
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
    @items = Item.all
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  

  def update
   if @item.update(item_params)
    redirect_to item_path
    else
    render :edit
    end
  end

  def show   
    
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit( :image, :product_name, :product_description, :product_category_id, :product_status_id, :burden_id, :area_id, :days_id, :selling_prise).merge(user_id: current_user.id)
  end

end

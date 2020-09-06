class OrdersController < ApplicationController
  before_action :move_to_signed_in
  before_action :move_to_index
  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
  end

  def new
    @order = Order.new
   
  end
  def create
    @order = Order.new(order_params)
    if @order.save!
     redirect_to root_path
    else
      redirect_to item_orders_path
    end
  end

  private

  def move_to_signed_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
  

  def move_to_index
      @item = Item.find(params[:item_id])
      if user_signed_in? && current_user.id == @item.user_id
         redirect_to root_path
      end
  end
    
  def order_params
    params.require(:order).permit( :postcode, :area_id, :city, :block, :building, :phone_number,).merge(user_id: current_user.id)
  end

end
class OrdersController < ApplicationController
  before_action :move_to_signed_in
  before_action :move_to_index
  def index
    @order = OrderBid.new
    
  end

  def new
    @order = OrderBid.new
   
  end
  def create
    @order = OrderBid.new(order_params)
    if @order.valid?
      pay_item
      @order.save
        return redirect_to root_path
    else
      render 'index'
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
    params.permit( :postcode, :area_id, :city, :block, :building, :phone_number, :bid_id,:token,:item_id).merge(user_id: current_user.id)
  end
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount:@item.selling_prise,
      card: order_params[:token],    
      currency:'jpy'                 
    )
  end
end
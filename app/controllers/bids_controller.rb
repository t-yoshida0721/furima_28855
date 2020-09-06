class BidsController < ApplicationController

  def index
    @bid=Bid.new
    redirect_to item_orders_path
  end

  def create
    @bid = Bid.new(price: bid_params[:price]
      if @bid.valid?
        
        pay_item
        @bid.save
        return redirect_to item_orders_path
      else
        render 'index'
      end
  end

  private

  def order_params
    params.permit(:price, :token)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: bid_params[:price],  
      card: bid_params[:token],    
      currency:'jpy'                 
    )
  end

end


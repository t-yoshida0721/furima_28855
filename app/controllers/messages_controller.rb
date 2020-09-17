class MessagesController < ApplicationController

  

  def create
    @item = Item.find(params[:item_id])
    @message = Message.create(message_params)
    if @message.save
      redirect_to "/items/#{@message.item.id}" 
     else
      render  'items/show'
      
     end
    
      @message = Message.new
     @messages = @item.messages.includes(:user)
     
  end

  private
  def message_params
    params.require(:message).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def item_params
    params.require(:item).permit( :image, :product_name, :product_description, :product_category_id, :product_status_id, :burden_id, :area_id, :days_id, :selling_prise, :item_id).merge(user_id: current_user.id)
  end

end
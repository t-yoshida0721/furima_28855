class OrdersController < ApplicationController
  before_action :move_to_signed_in
  before_action :move_to_index
  def index

  end

  def new

   
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

  
end

class OrdersController < ApplicationController
    before_action :authenticate_user!, only: :index
    before_action :set_item
    before_action :move_to_index, only: :index

    def index
      @order_address = OrderDestination.new
    end
  
    def create
      @order_address = OrderDestination.new(destination_params)
      if @order_address.valid?
        pay_item
        @order_address.save
        redirect_to root_path
      else
        render :index
      end
    end
  
    private
  
    def destination_params
      params.require(:order_destination).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
    end

    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
        Payjp::Charge.create(
        amount: @item.price,  
        card: destination_params[:token],   
        currency: 'jpy'                 
      )
    end

    def set_item
      @item = Item.find(params[:item_id])
    end

    def move_to_index
      if current_user.id == @item.user_id || @item.order.present?
         redirect_to root_path  
      end
    end
end

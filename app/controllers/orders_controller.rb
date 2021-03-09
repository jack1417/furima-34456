class OrdersController < ApplicationController
    before_action :authenticate_user!, except: :index
  
    def index
      @order_address = OrderDestination.new
      @item = Item.find(params[:item_id])
    end
  
    def new
    end
  
    def create
      @item = Item.find(params[:item_id])
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
end

class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @purchase_record_shipping_destination = PurchaseRecordShippingDestination.new
    if user_signed_in?
      if (current_user != @item.user && @item.purchase_record.present?) || current_user == @item.user
        redirect_to root_path
      end
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @purchase_record_shipping_destination = PurchaseRecordShippingDestination.new(purchase_record_params)
    if @purchase_record_shipping_destination.valid?
      pay_item
      @purchase_record_shipping_destination.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
    def purchase_record_params
      params.require(:purchase_record_shipping_destination).permit(:post_code, :prefecture_id, :city, :street_address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
    end

    def set_image
      @item = Item.find(params[:item_id])
    end
    
    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: purchase_record_params[:token],
        currency: 'jpy'
      )
    end
end

class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @purchase_record_shipping_destination = PurchaseRecordShippingDestination.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_record_shipping_destination = PurchaseRecordShippingDestination.new(purchase_record_params)
    if @purchase_record_shipping_destination.valid?
      @purchase_record_shipping_destination.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
    def purchase_record_params
      params.require(:purchase_record_shipping_destination).permit(:post_code, :prefecture_id, :city, :street_address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
    end

end

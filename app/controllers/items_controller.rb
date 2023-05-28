class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show] 
  before_action :set_item, except: [:index, :new, :create]
  def index
    @items = Item.order("created_at DESC")
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
  end

  def show
  end

  def edit
    if current_user.nil?
      redirect_to new_user_session_path
    elsif current_user != @item.user
      redirect_to root_path
    end
  end

  def update
    @item.update(item_params)
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    if user_signed_in? && current_user == @item.user
      @item.destroy
    end
    if @item.destroy
      redirect_to root_path
    end
  end


  private
  
  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :condition_id, :shipping_fee_responsibility_id, :prefecture_id, :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end



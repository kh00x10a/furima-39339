class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show] 

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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    if current_user.nil?
      redirect_to new_user_session_path
    elsif current_user != @item.user
      redirect_to root_path
    end
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end


  private
  
  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :condition_id, :shipping_fee_responsibility_id, :prefecture_id, :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end

end



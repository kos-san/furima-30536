class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy, :update]
  before_action :set_item, only: [:show, :edit, :update]
  def index
    @items = Item.all.order('created_at DESC')
    @buys = Buy.all
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
    @buys = Buy.all
    sold_out
  end

  def edit
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    if current_user.id == item.user_id
      item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def sold_out
    @sold_out = 0
    @buys.each do |buy|
      return @sold_out = 1 if buy.item_id == @item.id
    end
  end

  def item_params
    params.require(:item).permit(:name, :description, :price, :category_id, :condition_id, :charge_id, :area_id, :day_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end

class BuysController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @buy = Buy.new
  end

  def create
    @item = Item.find(params[:item_id])
    @buy = Buy.create(buy_params)
    binding.pry
    @address = Address.create(address_params)
    binding.pry
    redirect_to action: :index
  end

  private

  def address_params
    params.permit(:postal_code, :area_id, :city, :tel, :house_num, :building).merge(buy_id: @buy.id)
  end

  def buy_params
    params.permit(:item_id).merge(user_id: current_user.id)
  end
end

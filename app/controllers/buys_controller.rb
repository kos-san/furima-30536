class BuysController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @buy_address = BuyAddress.new
    buys = Buy.all
    buys.each do |buy|
      if buy.item_id == @item.id
        return redirect_to root_path
      end
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @buy_address = BuyAddress.new(buy_params)
    if @buy_address.valid?
      @buy_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_params
    params.require(:buy_address).permit(:postal_code, :area_id, :city, :house_num, :building, :tel, :item_id).merge(item_id: @item.id, user_id: current_user.id)
  end
end

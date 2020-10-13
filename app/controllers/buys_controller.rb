class BuysController < ApplicationController
  before_action :authenticate_user!
  def index
    @item = Item.find(params[:item_id])
    @buy_address = BuyAddress.new
    user_confirmation
  end

  def create
    @item = Item.find(params[:item_id])
    @buy_address = BuyAddress.new(buy_params)
    if @buy_address.valid?
      pay_item
      @buy_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_params
    params.require(:buy_address).permit(:postal_code, :area_id, :city, :house_num, :building, :tel).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def user_confirmation
    Buy.all.each do |buy| 
      if buy.item_id == @item.id || @item.user_id == current_user.id
        return redirect_to root_path
      end
    end
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: buy_params[:token],
      currency: 'jpy'
    )
  end
end

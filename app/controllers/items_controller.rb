class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy, :update]
  def index
    @items = Item.all.order('created_at DESC')
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

  # def edit
  #   @item = Item.find(params[:id])
  #   redirect_to show unless current_user.id == @item.user_id
  # end

  # def update
  #   item = Item.find(params[:id])
  #   item.update(item_params)
  #   if item.save
  #     redirect_to root_path
  #   else
  #     redirect_to edit_item_path
  #   end
  # end

  # def destroy
  #   @item = Item.find(params[:id])
  #   redirect_to show unless current_user.id == @item.user_id
  # end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :category_id, :condition_id, :charge_id, :area_id, :day_id, :image).merge(user_id: current_user.id)
  end
end

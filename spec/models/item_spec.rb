require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  context '商品の出品ができる時' do
    it '全ての値が入力されていれば登録できる' do
      expect(@item).to be_valid
    end
  end

  context '商品の出品ができない時' do
    it 'nameが空では登録できない' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it 'descriptionが空では登録できない' do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it 'categoryが選択されていなければ登録できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category Select')
    end
    it 'conditionが選択されていなければ登録できない' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Condition Select')
    end
    it 'chargeが選択されていなければ登録できない' do
      @item.charge_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Charge Select')
    end
    it 'areaが選択されていなければ登録できない' do
      @item.area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Area Select')
    end
    it 'dayが選択されていなければ登録できない' do
      @item.day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Day Select')
    end
    it 'imageが空では登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'priceが空では登録できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank", 'Price Out of setting range', 'Price Half-width number')
    end
    it 'priceが300未満では登録できない' do
      @item.price %= 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
    end
    it 'priceが10,000,000以上では登録できない' do
      @item.price *= 10 while @item.price < 9_999_999
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
    end
  end
end

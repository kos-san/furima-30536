require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @buy_address = FactoryBot.build(:buy_address)
    end

    context '登録ができるとき' do
      it '全ての情報が正しく入力されていれば保存できること' do
        expect(@buy_address).to be_valid
      end
      it '建物名が入力されていなくても登録できる' do
        @buy_address.building = nil
        expect(@buy_address).to be_valid
      end
    end

    context '登録ができない時' do
      it 'カード情報が空では登録できない' do
        @buy_address.token = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空では登録できない' do
        @buy_address.postal_code = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号が正しく入力されていないと登録できない' do
        @buy_address.postal_code = '1231234'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('Postal code Input correctly')
      end
      it '都道府県が選択されていないと登録できない' do
        @buy_address.area_id = 1
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('Area Select')
      end
      it '市町村が空だと登録できない' do
        @buy_address.city = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと登録できない' do
        @buy_address.house_num = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("House num can't be blank")
      end
      it '電話番号が空だと登録できない' do
        @buy_address.tel = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Tel can't be blank")
      end
      it '電話番号が半角英数でないと登録できない' do
        @buy_address.tel = '０９０１２３４１２３４'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('Tel Input only number')
      end
      it '電話番号が正しく入力されていないと登録できない' do
        @buy_address.tel = '090123412345'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('Tel Input only number')
      end
    end
  end
end

require 'rails_helper'

RSpec.describe UserPurchase, type: :model do
  before do
    @item = FactoryBot.create(:item)
    @user = FactoryBot.create(:user)
    sleep 0.1
    @user_purchase = FactoryBot.build(:user_purchase, item_id: @item.id, user_id: @user.id)
  end

  describe '商品購入' do
    context '商品購入ができるとき' do
      it '全ての値が入力されている時購入できる' do
        expect(@user_purchase).to be_valid
      end

      it 'buildingが空でも購入できる' do
        @user_purchase.building = ''
        expect(@user_purchase).to be_valid
      end
    end

    context '商品購入ができないとき' do
      it 'user_idが空だと購入できない' do
        @user_purchase.user_id = ''
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空だと購入できない' do
        @user_purchase.item_id = ''
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Item can't be blank")
      end

      it 'postal_codeが空だと購入できない' do
        @user_purchase.postal_code = ''
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it 'prefecture_idが空だと購入できない' do
        @user_purchase.prefecture_id = ''
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'tokenが空だと購入できない' do
        @user_purchase.token = ''
        @user_purchase.valid?

        expect(@user_purchase.errors.full_messages).to include("Token can't be blank")
      end

      it 'cityが空だと購入できない' do
        @user_purchase.city = ''
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("City can't be blank")
      end

      it 'townが空だと購入できない' do
        @user_purchase.town = ''
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Town can't be blank")
      end

      it 'phone_numberが空だと購入できない' do
        @user_purchase.phone_number = ''
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが12桁以上だと購入できない' do
        @user_purchase.phone_number = '090121232322'
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberが英数混合だと購入できない' do
        @user_purchase.phone_number = 'a2a2'
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include('Phone number is invalid')
      end

      it 'prefecture_idが1だと購入できない' do
        @user_purchase.prefecture_id = 1
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'postal_codeがハイフンを入れた半角数字でないと購入できない' do
        @user_purchase.postal_code = '日'
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it 'phone_numberが半角数字のハイフンを除いた11桁でないと購入できない' do
        @user_purchase.phone_number = '09000'
        @user_purchase.valid?
        expect(@user_purchase.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end

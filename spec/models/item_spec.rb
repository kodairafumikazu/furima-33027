require 'rails_helper'


RSpec.describe User, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end


  describe "ユーザー新規出品" do

    context 'ユーザー新規出品ができるとき' do
      it "product_nameとinfoとcategory_idとproduct_condition_idとshipping_charge_idとprefecture_idとscheduled_delivery_idとpriceが存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context 'ユーザー新規出品ができないとき' do
      it "product_nameが空では登録できない" do
        @item.product_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it "infoが空では登録できない" do
        @item.info = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end
    
      it "product_condition_idが空では登録できない" do
        @item.product_condition_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Product condition is not a number")
      end
      it "product_condition_idが1の場合は登録できない" do
        @item.product_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Product condition must be other than 1")
      end
      it "shipping_charge_idが空では登録できない" do
        @item.shipping_charge_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge is not a number")
      end
      it "shipping_charge_idが1の場合は登録できない" do
        @item.shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge must be other than 1")
      end
      it "prefecture_idが空では登録できない" do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture is not a number")
      end
      it "prefecture_idが１の場合は登録できない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "scheduled_delivery_idが空では登録できない" do
        @item.scheduled_delivery_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery is not a number")
      end
      it "scheduled_delivery_idが1の場合は登録できない" do
        @item.scheduled_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery must be other than 1")
      end
      it "priceが空では登録できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "priceが全角数字では登録できない" do
        @item.price = "３３"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "priceが半角英数混合では登録できない" do
        @item.price = "a2"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "priceの範囲が300~9999999以外では登録できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "priceが半角英数でないと登録できない" do
        @item.price = "あ"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "imageが空だと保存できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
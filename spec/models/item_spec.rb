require 'rails_helper'


RSpec.describe User, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end


  describe "ユーザー商品出品" do
    it "product_nameが空では登録できない" do
      @item.product_name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Product name can't be blank")#("User must exist")
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
    it "shipping_charge_idが空では登録できない" do
      @item.shipping_charge_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping charge is not a number")
    end
    it "prefecture_idが空では登録できない" do
      @item.prefecture_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture is not a number")
    end
    it "scheduled_delivery_idが空では登録できない" do
      @item.scheduled_delivery_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Scheduled delivery is not a number")
    end
    it "priceが空では登録できない" do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
    it "priceの範囲が300~9999999以外では登録できない" do
      @item.price = "2"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end
    it "priceが半角英数でないと登録できない" do
      @item.price = "あ"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
  end
end 
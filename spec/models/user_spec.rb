require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe "ユーザー新規登録" do

    context '新規登録ができるとき' do
      it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録ができないとき' do
      it "nicknameが空では登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

       it "passwordが5文字以下では登録できない" do
         @user.password = "0000"
         @user.password_confirmation = "0000"
         @user.valid?
         expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
       end

       it "passwordは半角英数文字がなければ登録できない" do
         @user.password = "ああああああ"
         @user.valid?
         expect(@user.errors.full_messages).to include("Password には6文字以上の半角英字と半角数字の両方を含めて設定してください")
       end

      
  
      it "first_nameが全角（漢字、ひらがな、カタカナ）でなければ登録できない" do
        @user.first_name = "ttt"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角（漢字、ひらがな、カタカナ）文字を使用してください")
      end
      it "last_nameが全角（漢字、ひらがな、カタカナ）でなければ登録できない" do
        @user.last_name = "ttt"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 全角（漢字、ひらがな、カタカナ）文字を使用してください")
      end
      it "first_name_kanaが全角（カタカナ）でなければ登録できない" do
        @user.first_name_kana = "ttt"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana 全角カタカナを使用してください")
      end
      it "last_name_kanaが全角（カタカナ）でなければ登録できない" do
        @user.last_name_kana = "ttt"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana 全角カタカナを使用してください")
      end
      it "birth_dateが空では登録できない" do
        @user.birth_date = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end

    end
  end
end

class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user.id || @item.purchase.present?
    @user_purchase = UserPurchase.new
    
  end

  def create
    @item = Item.find(params[:item_id])
    
    @user_purchase = UserPurchase.new(purchase_params)
    if @user_purchase.valid?
      @user_purchase.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:user_purchase).permit(:postal_code, :prefecture_id, :city, :town, :building, :phone_number, :purchase_id).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end
end

# koさんが出品する → 違うユーザーが購入する → koさんでログインして~/purchase

class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])

    @user_purchase = UserPurchase.new
  end

  def create
    @user_purchase = UserPurchase.new(purchase_params)

    if @user_purchase.valid?
      @user_purchase.save
      redirect_to root_path
    else
      redirect_to action: :index
    end
  end

  private

  def purchase_params
    params.require(:user_purchase).permit(:postal_code, :prefecture_id, :city, :town, :building, :phone_number, :purchase_id).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end
end

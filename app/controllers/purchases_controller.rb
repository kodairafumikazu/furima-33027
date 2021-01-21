class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_item, only: [:index, :create]

  def index
    redirect_to root_path if current_user.id == @item.user.id || @item.purchase.present?
    @user_purchase = UserPurchase.new
  end

  def create
    @user_purchase = UserPurchase.new(purchase_params)
    if @user_purchase.valid?
      @user_purchase.save
      redirect_to root_path
    else
      render :index
    end
  end

  def pay_item
    Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
    Payjp::Charge.create(
      amount: order_params[:@item.price],
      card: order_params[:token],
      currency:'jpy'
    )
 end

  private

  def purchase_params
    params.require(:user_purchase).permit(:postal_code, :prefecture_id, :city, :town, :building, :phone_number, :purchase_id).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end

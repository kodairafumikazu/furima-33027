class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update]
  #before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    if @item.user.id != current_user.id  
      redirect_to root_path
    end
    

  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
     if current_user.update(user_params)
       redirect_to root_path
     else
       render :edit
     end
  end

  # def create
  #   @item = Item.new(item_params)
  #   if @item.save
  #     redirect_to root_path
  #   else
  #     render :new
  #   end
  # end

  private

  def item_params
    params.require(:item).permit(:image, :product_name, :info, :category_id, :product_condition_id, :shipping_charge_id,
                                 :prefecture_id, :scheduled_delivery_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end

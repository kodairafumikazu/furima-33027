class Item < ApplicationRecord

  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :Prefecture
  belongs_to :product_condition
  belongs_to :scheduled_delivery
  belongs_to :shipping_charge
  # has_one    :purchase
  has_one_attached :image

  with_options presence: true  do
    validates :product_name
    validates :info
  end

  validates :price, numericality: {
    greater_than_or_equal_to: 300,
    less_than: 9999999                         
  }

  validates :category_id, numericality: { other_than: 1 }
  validates :product_condition_id, numericality: { other_than: 1 }
  validates :shipping_charge_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :scheduled_delivery_id, numericality: { other_than: 1 }
end


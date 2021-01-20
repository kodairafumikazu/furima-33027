class UserPurchase
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :town, :building, :phone_number, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :town
    validates :phone_number, format: { with: /\A[0-9]{11}\z/ }
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Addresse.create(postal_code: postal_code, phone_number: phone_number, prefecture_id: prefecture_id, city: city, town: town,
                    building: building, purchase_id: purchase.id)
  end
end

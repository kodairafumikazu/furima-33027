FactoryBot.define do
  factory :item do
    product_name                { '部屋' }
    info                        { '新築です' }
    category_id                 { 3 }
    product_condition_id        { 3 }
    shipping_charge_id          { 4 }
    prefecture_id               { 4 }
    scheduled_delivery_id       { 5 }
    price                       { 3000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/sample.jpg'), filename: 'sample.jpg')
    end
  end
end

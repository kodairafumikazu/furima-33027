FactoryBot.define do
  factory :item do
    product_name                {"部屋"}
    info                        {"新築です"}
    category_id                 {10}
    product_condition_id        {10}
    shipping_charge_id          {10}
    prefecture_id               {10}
    scheduled_delivery_id       {10}
    price                       {3000}
    association :user
  end
end


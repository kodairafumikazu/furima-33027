FactoryBot.define do
  factory :user_purchase do
    postal_code    { '123-4567' }
    prefecture_id  { 3 }
    city           { '横浜市緑区' }
    town           { '青山1-1-1' }
    phone_number   { '09012345678' }
    user_id        { 3 }
    item_id        { 3 }
  end
end

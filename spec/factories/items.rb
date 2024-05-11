FactoryBot.define do
  factory :item do
    item_name { "マスク" }
    detail { Faker::Lorem.sentence }
    category_id { 2 }
    condition_id { 2 }
    delivery_charge_id { 3 }
    prefecture_id { 3 }
    shipping_day_id { 3 }
    price { 480 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/mask.png'), filename: 'mask.png')
    end
  end
end

FactoryBot.define do
  factory :order_address do
    post_code { '123-4567' }
    prefecture_id { 4 }
    municipalities { '盛岡市' }
    street_address { '1-1' }
    building_name { 'フロンティアビル3F' }
    tel_number { 11111111111 }
    token { 'tok_abcdefghijk12345678901234567' }

    association :user_id
    association :item_id
  end
end

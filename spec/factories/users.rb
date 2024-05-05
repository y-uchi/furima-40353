FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.email}
    password { '1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name { "山田" }
    first_name { "太郎" }
    kana_family_name { "ヤマダ" }
    kana_first_name { "タロウ" }
    birthday {Faker::Date.birthday}
  end
end

FactoryBot.define do
  factory :user do
    nickname               { Faker::Name.name }
    email                  { Faker::Internet.email }
    password               { '1a' + Faker::Internet.password(min_length: 4) }
    password_confirmation  { password }
    last_name              { '山田' }
    kana_last_name         { 'ヤマダ' }
    first_name             { '太郎' }
    kana_first_name        { 'タロウ' }
    birthday               { Faker::Date.birthday }
  end
end

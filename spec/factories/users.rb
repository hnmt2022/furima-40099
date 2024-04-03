FactoryBot.define do
  factory :user do

    nickname            {Faker::Name.name}
    email               {Faker::Internet.email}
    password            {Faker::Internet.password(min_length: 6)}
    encrypted_password  {password}
    last_name           {'山田'}
    kana_last_name      {'ヤマダ'}
    first_name          {'太郎'}
    kana_first_name     {'タロウ'}
    birthday            {Faker::Date.birthday}

   

  end
end
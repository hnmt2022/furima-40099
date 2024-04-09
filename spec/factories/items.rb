FactoryBot.define do
  factory :item do
    item_name                  { Faker::Name.name }
    item_info                  { Faker::Lorem.sentence }
    price                      { Faker::Number.between(from: 300, to: 9_999_999) }
    category_id                { Faker::Number.between(from: 2, to: 11) }
    sales_status_id            { Faker::Number.between(from: 2, to: 7) }
    shipping_fee_id            { Faker::Number.between(from: 2, to: 3) }
    item_prefecture_id         { Faker::Number.between(from: 2, to: 48) }
    scheduled_delivery_id      { Faker::Number.between(from: 2, to: 4) }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/22586 - コピー.jpg'), filename: '22586 - コピー.jpg')
    end
  end
end

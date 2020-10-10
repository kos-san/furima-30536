FactoryBot.define do
  factory :item do
    association :user
    Faker::Config.locale = :ja
    name          { '商品名' }
    description   { Faker::Lorem.sentence }
    price         { Faker::Number.number % 9_999_699 + 300 }
    category_id   { Faker::Number.number % 10 + 2 }
    condition_id  { Faker::Number.number % 6 + 2 }
    charge_id     { Faker::Number.number % 2 + 2 }
    area_id       { Faker::Number.number % 46 + 2 }
    day_id        { Faker::Number.number % 3 + 2 }

    after(:build) do |item_image|
      item_image.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

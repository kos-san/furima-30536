FactoryBot.define do
  factory :item do
    association :user
    Faker::Config.locale = :ja
    name          { '商品名' }
    description   { Faker::Lorem.sentence }
    price         { 5000 }
    category_id   { 2 }
    condition_id  { 2 }
    charge_id     { 2 }
    area_id       { 2 }
    day_id        { 2 }

    after(:build) do |item_image|
      item_image.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

FactoryBot.define do
  factory :user do
    nickname               { Faker::Name.name }
    email                  { Faker::Internet.free_email }
    password               { Faker::Internet.password(min_length: 6) + '1a' }
    password_confirmation  { password}
    first_name             {'鈴木'}
    last_name              {'太郎'}
    first_name_kana        {'スズキ'}
    last_name_kana         {'タロウ'}
    birthday               {'2000-01-02'}
  end
end

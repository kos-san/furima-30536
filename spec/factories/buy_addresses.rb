FactoryBot.define do
  factory :buy_address do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '123-1234' }
    area_id { '2' }
    city { '市町村' }
    house_num { '〇〇１２３−４' }
    building { '建物名' }
    tel { '09012341234' }
    user_id { 1 }
    item_id { 1 }
  end
end

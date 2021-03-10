FactoryBot.define do
  factory :order_destination do
    post_code { '123-4567' }
    prefecture_id { 2 }
    city { '横浜市緑区' }
    address { '青山1-1-1' }
    building_name { '東京ハイツ' }
    phone_number { '09000009999'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end

FactoryBot.define do
  factory :order_address do
    token { "tok_abcdefghijk00000000000000000" }
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    street { '青山1-1-1' }
    building_name { '東京ハイツ' }
    phone_number { '09011111111' }
  end
end

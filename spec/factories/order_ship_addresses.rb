FactoryBot.define do
  factory :order_ship_address do
    token {"tok_abcdefghijk00000000000000000"}
    post { '123-4567' }
    delivery_id { 2 }
    city { '足立区' }
    line { '1-1' }
    build_name { '足立マンション' }
    tell { 3333333333 }
    item_id { Faker::Number.between(to: 999) }
  end
end

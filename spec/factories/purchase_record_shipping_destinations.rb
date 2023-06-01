FactoryBot.define do
  factory :purchase_record_shipping_destination do
    post_code                         {'111-1111'}
    prefecture_id                     {Faker::Number.between(from: 2, to: 48)}
    city                              {'さいタマ市'}
    street_address                    {'中おうク1-1-1'}
    building_name                     {nil}
    phone_number                      {'0000000000'}
    token                             {"tok_abcdefghijk00000000000000000"}
  end
end

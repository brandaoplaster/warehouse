FactoryBot.define do
  factory :order_item do
    association :order
    association :product
    quantity { rand(1..5) }
    unit_price { Faker::Commerce.price(range: 5.0..200.0) }
  end
end

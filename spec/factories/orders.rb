FactoryBot.define do
  factory :order do
    association :user
    total_price { Faker::Commerce.price(range: 10.0..500.0) }
    status { :pending }
    credit_card_number { Faker::Finance.credit_card(:visa).gsub('-', '') }
    credit_card_name { Faker::Name.name }
    credit_card_cvv { Faker::Number.number(digits: 3).to_s }
    credit_card_expiration_month { rand(1..12) }
    credit_card_expiration_year { rand(Date.current.year..(Date.current.year + 5)) }
  end
end

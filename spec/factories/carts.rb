FactoryBot.define do
  factory :cart do
    association :user
    status { 0 }
    expired_at { Faker::Time.forward(days: 3) }
  end
end
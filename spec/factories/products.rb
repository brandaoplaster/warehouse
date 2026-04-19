FactoryBot.define do
  factory :product do
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.paragraph(sentence_count: 2) }
    price { Faker::Commerce.price(range: 5.0..500.0) }
    image { Rack::Test::UploadedFile.new(Rails.root.join("spec/support/images/image_#{rand(1..5)}.jpg")) }
    stock { rand(1..100) }
    active { [ true, false ].sample }
  end
end

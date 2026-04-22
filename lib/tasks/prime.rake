if Rails.env.development? || Rails.env.test?
  require "factory_bot"

  namespace :dev do
    desc "Sample data for local development environment"
    task prime: "db:setup" do
      include FactoryBot::Syntax::Methods

      users = 3.times.map { create(:user) }

      products = 50.times.map { create(:product) }

      100.times do
        order = create(:order, user: users.sample)

        products.sample(rand(2..5)).each do |product|
          create(:order_item,
            order: order,
            product: product,
            quantity: rand(1..5),
            unit_price: product.price
          )
        end
      end
    end
  end
end

if Rails.env.development? || Rails.env.test?
  require "factory_bot"

  namespace :dev do
    desc "Sample data for local development environment"
    task prime: "db:setup" do
      include FactoryBot::Syntax::Methods

      5.times do
        create(:user)
      end

      50.times do
        create(:product)
      end
    end
  end
end

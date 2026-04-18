module Store
  class HomeController < ApplicationController
    require "faker"
    require "ostruct"
    def index
      @products = 8.times.map do
        OpenStruct.new(
          name: Faker::Commerce.product_name,
          price: Faker::Commerce.price(range: 10..200)
        )
      end
    end
  end
end

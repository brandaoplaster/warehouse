module Store
  class HomeController < ApplicationController
    def index
      @products = Product.all
      @carousel_items = Product.limit(5)
    end
  end
end

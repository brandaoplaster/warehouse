module Account
  class DashboardController < ApplicationController
    def index
      @products = Product.limit(4)
      @orders = Order.limit(5)
    end
  end
end

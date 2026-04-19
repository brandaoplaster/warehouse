module Store
  class HomeController < ApplicationController
    require "faker"
    require "ostruct"
    def index
      @products = Product.all
    end
  end
end

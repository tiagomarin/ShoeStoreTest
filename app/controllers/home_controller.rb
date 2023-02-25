class HomeController < ApplicationController
  def index
    @new_arrivals = Product.last(10)
  end
end

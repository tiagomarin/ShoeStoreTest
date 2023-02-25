class HomeController < ApplicationController
  def index
    # Recent added products
    @new_arrivals = Product.last(10)

    # Fixed iconic items
    @iconic1 = Iconic.find(1)
    @iconic2 = Iconic.find(2)
    @iconic3 = Iconic.find(3)

    # All products
    @products = Product.all
  end
end

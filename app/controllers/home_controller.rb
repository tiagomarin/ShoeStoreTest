class HomeController < ApplicationController
  def index
    # Recent added products
    @new_arrivals = remove_duplicates(Product.last(60))

    # Main categories
    @home_category1 = HomeCategory.find(1)
    @home_category2 = HomeCategory.find(2)
    @home_category3 = HomeCategory.find(3)

    # Fixed iconic items
    @iconic1 = Iconic.find(1)
    @iconic2 = Iconic.find(2)
    @iconic3 = Iconic.find(3)

    # All products
    @products = remove_duplicates(Product.all)

    # Collection
    @home_collection = HomeCollection.first

    # Decorations
    @decorations = Decoration.all
  end

  private

  def remove_duplicates(products)
    @products_no_repeat = []
    products.each do |product|
      @products_no_repeat << product unless @products_no_repeat.any? do |p|
                                              p.name == product.name &&
                                              p.brand.name == product.brand.name &&
                                              p.color == product.color
                                            end
    end
    @products_no_repeat
  end
end

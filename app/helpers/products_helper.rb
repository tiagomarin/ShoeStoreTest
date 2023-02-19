module ProductsHelper
  def color_quantity(product)
    color_quantity = 0
    name = product.name
    brand = product.brand.name
    description = product.description
    color = product.color
    Product.all.each do |p|
      if p.name == name && p.brand.name == brand && p.description == description && p.color == color
        color_quantity += 1
      end
    end
    color_quantity
  end
end

module ProductsHelper
  # get all products with the same name, brand, description but with different colors
  def same_product_different_colors(product, products)
    name = product.name
    color_id = product.color.id
    result = []
    products.filter do |p|
      result << p if p.name == name && p.color_id != color_id
    end
    result
  end

  # get all products with the same name, brand, description but with different sizes
  def sizes_available(product)
    name = product.name
    brand_id = product.brand.id
    color_id = product.color.id
    size_id = product.size.id
    Product.where(name:).where(brand_id:).where(color_id:).where.not(size_id:)
  end
end

module ProductsHelper
  # get all products with the same name, brand, description but with different colors
  def same_product_different_colors(product)
    name = product.name
    brand_id = product.brand.id
    size = product.size
    color_id = product.color.id
    Product.where(name:).where(brand_id:).where(size:).where.not(color_id:)
  end

  # get all products with the same name, brand, description but with different sizes
  def sizes_available(product)
    name = product.name
    brand_id = product.brand.id
    color_id = product.color.id
    size = product.size
    Product.where(name:).where(brand_id:).where(color_id:).where.not(size:)
  end
end

module ProductsHelper
  # get all products with the same name, brand, description but with different colors
  def same_product_different_colors(product)
    name = product.name
    brand_id = product.brand.id
    size = product.size
    color = product.color
    Product.where(name:).where(brand_id:).where(size:).where.not(color:)
  end

  # get all products with the same name, brand, description but with different sizes
  def sizes_available(product)
    name = product.name
    brand_id = product.brand.id
    color = product.color
    size = product.size
    Product.where(name:).where(brand_id:).where(color:).where.not(size:)
  end
end

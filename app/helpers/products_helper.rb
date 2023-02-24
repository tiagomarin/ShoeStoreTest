module ProductsHelper
  # get all products with the same name, brand, description but with different colors
  def same_product_different_colors(product)
    name = product.name
    brand_id = product.brand.id
    description = product.description
    color = product.color
    Product.where(name:).where(brand_id:).where(description:).where.not(color:)
  end
end

module ProductsHelper
  # get all products with the same name, brand, description but with different colors
  def same_product_different_colors(product)
    same_product_different_colors = []
    name = product.name
    brand_id = product.brand.id
    description = product.description
    color = product.color
    same_product_different_colors = Product.where(name:).where(brand_id:).where(description:).where.not(color: color)
      # if (p.name == name &&
      #     p.brand.name == brand &&
      #     p.description == description &&
      #     p.color != color)
      #   same_product_different_color << p
      # end
    same_product_different_colors
  end

end

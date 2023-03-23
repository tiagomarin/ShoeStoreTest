# rubocop:disable all
module ApplicationHelper
  def products_index
    controller_name == 'products' && action_name == 'index'
  end

  def products_show
    controller_name == 'products' && action_name == 'show'
  end

  def admin_path
      current_page?(admin_products_path) ||
      current_page?(admin_brands_path) ||
      current_page?(admin_promo_codes_path) ||
      current_page?(admin_iconics_path) ||
      current_page?(admin_users_path) ||
      current_page?(admin_orders_path) ||
      current_page?(admin_decorations_path) ||
      current_page?(admin_colors_path) ||
      current_page?(admin_sizes_path) ||
      current_page?(admin_genders_path) ||
      current_page?(admin_archived_path) ||
      current_page?(admin_collections_path) ||
      current_page?(admin_collection_home_path) ||
      current_page?(admin_categories_path) ||
      current_page?(admin_category_home_path) ||
      current_page?(new_product_path) ||
      current_page?(new_category_path) ||
      current_page?(new_brand_path) ||
      current_page?(new_color_path) ||
      current_page?(new_size_path) ||
      current_page?(new_gender_path) ||
      current_page?(new_promo_code_path)
  end
end

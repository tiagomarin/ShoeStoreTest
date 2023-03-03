module ApplicationHelper
  def products_index
    controller_name == 'products' && action_name == 'index'
  end

  def products_show
    controller_name == 'products' && action_name == 'show'
  end

  def admin_path
    current_page?(admin_products_path) ||
      current_page?(admin_categories_path) ||
      current_page?(admin_brands_path) ||
      current_page?(admin_promo_codes_path) ||
      current_page?(admin_iconics_path) ||
      current_page?(admin_users_path) ||
      current_page?(admin_orders_path) ||
      current_page?(admin_decorations_path) ||
      current_page?(admin_colors_path)
  end
end

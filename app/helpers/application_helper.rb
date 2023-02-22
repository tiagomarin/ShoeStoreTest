module ApplicationHelper
  def products_index
    controller_name == 'products' && action_name == 'index'
  end
  def products_show
    controller_name == 'products' && action_name == 'show'
  end
end

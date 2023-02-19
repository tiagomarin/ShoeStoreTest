module ApplicationHelper
  def products_show
    controller_name == 'products' && action_name == 'show'
  end
end

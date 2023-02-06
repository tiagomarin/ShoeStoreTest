class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :initialize_order

  def initialize_order
    return unless current_user

    @last_order = Order.where(user: current_user).last
    @order = if @last_order&.status&.match?('Shopping Cart')
               @last_order

             else
               Order.create(user: current_user, total_price: 0, status: 'Shopping Cart')
             end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email password])
  end
end

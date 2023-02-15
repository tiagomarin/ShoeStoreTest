class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :initialize_order

  private

  def initialize_order
    return unless current_user

    @last_order = Order.where(user: current_user).last
    @order = if @last_order&.status&.match?('Shopping Cart')
               @last_order

             else
               Order.create(user: current_user, status: 'Shopping Cart')
             end
  end

  # find the biggest discount among all VALID promo_codes of an item in cart
  def code_discount(product, promo_codes)
    code_discount = 0

    promo_codes.each do |promo_code|
      # check if item in cart has any category that is valid for this promo code
      valid_brand_ids = Brand.joins(:promo_codes).where(promo_codes: { id: promo_code }).map(&:id)
      if promo_code.category_ids.intersect?(product.category_ids) || product.brand_id.in?(valid_brand_ids)
        code_discount = promo_code.value
      end
    end
    code_discount
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email password])
  end
end

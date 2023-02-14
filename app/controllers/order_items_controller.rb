class OrderItemsController < ApplicationController
  before_action :authenticate_user!

  def create
    @product = Product.where(name: params[:order_item][:name], color: params[:order_item][:color],
                             size: params[:order_item][:size]).take

    quantity_requested = params[:order_item][:quantity].to_i
    quantity_available = if @product
                           @product.quantity.to_i
                         else
                           0
                         end

    if quantity_available >= quantity_requested
      if (item_in_cart = OrderItem.where(product: @product, order: @order).take)
        if quantity_requested <= (quantity_available - item_in_cart.quantity.to_i)
          final_quantity = item_in_cart.quantity + quantity_requested
          
          # find all promo codes applied in this order
          promo_codes = PromoCode.where(id: @order.promo_code_ids)
          # find the biggest discount among all promo codes that are valid for this item

          puts "================================"
          pp promo_codes
          pp item_in_cart
          puts "================================"

          code_discount = code_discount(item_in_cart, promo_codes)

          total_price = ((final_quantity * @product.price) * (1 - (@product.discount.to_f  / 100)) * code_discount).ceil(2)
          item_in_cart.update!(quantity: final_quantity, total_price:, code_discount:)
        else
          puts 'Not enough products'
        end
      else # if item is not in cart
        total_price = ((@product.price * quantity_requested) * (1 - (@product.discount.to_f / 100))).ceil(2)
        OrderItem.create!(product: @product, order: @order, quantity: quantity_requested, total_price:)
      end
    else
      puts 'Not enough products'
    end
  end

  def destroy
    OrderItem.find(params[:id]).destroy

    respond_to do |format|
      format.html do
        redirect_to user_order_path(current_user, @order), notice: 'Order Item was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private
  # find the biggest discount among all promo codes that are valid for this item
  def code_discount(order_item, promo_codes)
    code_discount = order_item.code_discount || 0
    product = Product.find(order_item.product_id)
    promo_codes.each do |promo_code|
      # check if item in cart has any category that is valid for this promo code
      if promo_code.category_ids.intersect?(product.category_ids)
        code_discount = promo_code.value if code_discount < promo_code.value
      end
    end
    1 - (code_discount.to_f / 100).ceil(2)
  end
end

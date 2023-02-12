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
          total_price = (final_quantity * @product.price) * (1 - (@product.discount / 100)) * (1 - (@order.code_discount / 100))
          item_in_cart.update!(quantity: final_quantity, total_price:)
        else
          puts 'Not enough products'
        end
      else # if item is not in cart
        total_price = (@product.price * quantity_requested) * (1 - (@product.discount / 100))
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
end

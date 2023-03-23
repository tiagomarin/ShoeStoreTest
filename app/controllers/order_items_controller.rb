class OrderItemsController < ApplicationController
  before_action :authenticate_user!
  def create
    size = Size.where(number: params[:order_item][:size]).take
    color = Color.where(name: params[:order_item][:color]).take

    @product = Product.where(name: params[:order_item][:name], color:, size:).take

    quantity_requested = params[:order_item][:quantity].to_i
    quantity_available = if @product
                           @product.quantity.to_i
                         else
                           0
                         end

    if quantity_available >= quantity_requested
      if (item_in_cart = OrderItem.where(product: @product, order: @order).take)
        if quantity_requested <= (quantity_available - item_in_cart.quantity.to_i)
          # find all promo codes applied in this order
          promo_codes = PromoCode.where(id: @order.promo_code_ids)
          code_discount = code_discount(@product, promo_codes) # call method from application_controller.rb
          quantity = item_in_cart.quantity + quantity_requested
          total_price = calculate_total_price(@product, quantity, code_discount) # call method from app_controller.rb
          # Update the item in cart
          item_in_cart.update!(quantity:, total_price:, code_discount:)
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

  def update
    @order_item = OrderItem.find(params[:id])
    total_price = calculate_total_price(@order_item.product, params[:order_item][:quantity].to_i,
                                        @order_item.code_discount)

    respond_to do |format|
      if @order_item.update!(quantity: params[:order_item][:quantity], total_price:)
        format.html do
          redirect_to user_order_path(current_user, @order), notice: 'Quantity was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @order_item }
      else
        format.html { render :show, status: :unprocessable_entity }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
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

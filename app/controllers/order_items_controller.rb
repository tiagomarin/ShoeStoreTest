class OrderItemsController < ApplicationController
  before_action :authenticate_user!

  def create
    @product = Product.where(name: params[:order_item][:name], color: params[:order_item][:color],
                             size: params[:order_item][:size]).take

    quantity_requested = params[:order_item][:quantity].to_i
    quantity_total = if @product
                       @product.quantity.to_i
                     else
                       0
                     end

    if quantity_total >= quantity_requested
      if (new_order_item = OrderItem.where(product: @product, order: @order).take)
        if quantity_requested <= (@product.quantity - new_order_item.quantity)
          new_order_item.update!(quantity: new_order_item.quantity + quantity_requested,
                                 total_price: (new_order_item.quantity + quantity_requested) * @product.price)
        else
          puts 'Not enough products'
        end
      else
        OrderItem.create!(product: @product, order: @order, quantity: quantity_requested, price: @product.price,
                          total_price: @product.price * quantity_requested)
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

  def product_params
    params
      .require(:product)
      .permit(:name, :size, :color)
  end
end

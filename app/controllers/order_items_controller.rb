class OrderItemsController < ApplicationController
  before_action :authenticate_user!

  def create
    @product = Product.where(name: params[:order_item][:name], color: params[:order_item][:color],
                             size: params[:order_item][:size]).take

    quantity_requested = params[:order_item][:quantity].to_i
    quantity_total = @product.quantity.to_i

    if quantity_total >= quantity_requested
      OrderItem.create!(product: @product, order: @order, quantity: quantity_requested)
    else
      puts 'wrong quantity'
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

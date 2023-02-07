class OrderItemsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @product = Product
    .where(name: params[:order_item][:name])
    .where(color: params[:order_item][:color])
    .where(size: params[:order_item][:size])

    # available = Product.find(params[:product_id]).quantity
    # quantity = params:[:quantity]

    # if available >= quantity
    #   @order_item = OrderItem.create(product_id: params[:product_id], order_id: @order.id)
    # else
    #   puts 'wrong quantity'
    #   # show error message
    # end
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

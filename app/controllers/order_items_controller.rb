class OrderItemsController < ApplicationController
  before_action :authenticate_user!

  def create
    @order_item = OrderItem.create(product_id: params[:product_id], order_id: @order.id)
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

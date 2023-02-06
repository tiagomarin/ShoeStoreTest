class OrderItemsController < ApplicationController
  before_action :authenticate_user!

  def create
    @order_item = OrderItem.create(product_id: params[:product_id], order_id: @order.id)
  end
end

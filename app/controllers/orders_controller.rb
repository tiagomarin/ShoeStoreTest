class OrdersController < ApplicationController
  before_action :set_order, only: %i[show edit update destroy]
  before_action :set_order_items, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /orders or /orders.json
  def index
    # @orders = Order.all
    @orders = Order.where(user: current_user)
  end

  # GET /orders/1 or /orders/1.json
  def show
    @render_order = false
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit; end

  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to user_orders_path(current_user, @order), notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)

        @order.order_items.each do |item|
          product = Product.find(item.product_id)
          product.update(quantity: product.quantity - item.quantity)
        end

        format.html { redirect_to user_orders_path(current_user, @order), notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy

    respond_to do |format|
      format.html { redirect_to user_orders_path(current_user), notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  def set_order_items
    @order_items = OrderItem.where(order_id: params[:id])
  end

  # Only allow a list of trusted parameters through.
  def order_params
    params
      .require(:order)
      .permit(:status, :promo_code)
      .with_defaults(status: 'Shopping Cart')
  end
end

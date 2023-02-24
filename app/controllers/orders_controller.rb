class OrdersController < ApplicationController
  before_action :set_order, only: %i[show edit update destroy]
  before_action :set_order_items, only: %i[show edit update destroy]
  before_action :set_promo_code, only: %i[update add_promo_code remove_promo_code]
  before_action :check_promo_code, only: %i[add_promo_code remove_promo_code]
  before_action :authenticate_user!

  # GET /orders or /orders.json
  def index
    # @orders = Order.all
    @orders = Order.where(user: current_user)
  end

  # GET /orders/1 or /orders/1.json
  def show
    @render_order = false
    @subtotal = 0
    @discount = 0
    @coupons_discount = 0
    @order.order_items.each do |order_item|
      product = Product.find(order_item.product_id)
      @subtotal += product.price * order_item.quantity
      @discount += ((product.price * order_item.quantity) * product.discount) / 100
      @coupons_discount += ((product.price * order_item.quantity) * order_item.code_discount) / 100
    end
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
    add_promo_code
    remove_promo_code
    respond_to do |format|
      # if @order.update(order_params)

      #   @order.order_items.each do |item|
      #     product = Product.find(item.product_id)
      #     product.update(quantity: product.quantity - item.quantity)
      #   end

      #   format.html { redirect_to user_order_path(current_user, @order), notice: 'Order was successfully updated.' }
      #   format.json { render :show, status: :ok, location: @order }
      # else
      #   format.html { render :edit, status: :unprocessable_entity }
      #   format.json { render json: @order.errors, status: :unprocessable_entity }
      # end
    end
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def add_promo_code
    # calculate cupon discount on order
    return unless params[:commit] == 'Apply Code'

    # check if code is already applied
    if !@order.promo_code_ids.empty? && @order.promo_code_ids.include?(@promo_code.id)
      @promo_code_ids = @order.promo_code_ids
      redirect_to user_order_path(current_user, @order), notice: 'This code is already applied'
    else
      @promo_code_ids = @order.promo_code_ids << @promo_code.id
    end

    return unless @order.update(promo_code_ids: @promo_code_ids)

    # find categories and brands the promo_code aplied is valid for
    valid_categories_ids = Category.joins(:promo_codes).where(promo_codes: { id: @promo_code }).map(&:id)
    valid_brand_ids = Brand.joins(:promo_codes).where(promo_codes: { id: @promo_code }).map(&:id)

    # find all products that will be discounted and update the code_discount on them.
    @order_items.each do |order_item|
      product = Product.find(order_item.product_id)
      # check next item in cart if this doesn't have any category that is valid for this promo code
      next unless product.category_ids.intersect?(valid_categories_ids) || product.brand_id.in?(valid_brand_ids)
      # return if item in cart already has a bigger discount
      next unless order_item.code_discount < @promo_code.value

      code_discount = @promo_code.value
      # calculation steps
      price_quantity = product.price * order_item.quantity
      product_discount = (1 - (product.discount.to_f / 100))
      promo_code_discount = (1 - (code_discount / 100))
      # calculate total price for this item
      total_price = (price_quantity * product_discount * promo_code_discount).ceil(2)
      order_item.update!(code_discount:, total_price:)
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity

  def remove_promo_code
    return unless params[:commit] == 'Remove Code'

    promo_code_ids = @order.promo_code_ids.filter { |id| id != @promo_code.id }

    return unless @order.update(promo_code_ids:)

    promo_codes = PromoCode.where(id: @order.promo_code_ids)

    # loop through all order items and update the code_discount and total_price
    @order_items.each do |order_item|
      product = Product.find(order_item.product_id)
      code_discount = code_discount(product, promo_codes)

      price_quantity = product.price * order_item.quantity
      product_discount = (1 - (product.discount.to_f / 100))
      promo_code_discount = (1 - (code_discount / 100))

      total_price = (price_quantity * product_discount * promo_code_discount).ceil(2)
      order_item.update!(code_discount:, total_price:)
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

  def set_promo_code
    @promo_code = PromoCode.where(title: params[:order][:promo_code]).take
  end

  def check_promo_code
    return if PromoCode.exists?(title: params[:order][:promo_code])

    redirect_to user_order_path(current_user, @order), notice: "This code doen't exist or is not valid anymore"
  end

  # Only allow a list of trusted parameters through.
  def order_params
    params
      .require(:order)
      .permit(:status, :promo_code_ids)
      .with_defaults(status: 'Shopping Cart', promo_code_ids: [])
  end
end

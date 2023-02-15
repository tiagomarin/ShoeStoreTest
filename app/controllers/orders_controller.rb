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
    add_promo_code()
    remove_promo_code()
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

  def add_promo_code
    # calculate cupon discount on order
    return unless params[:commit] == 'Apply Code'

    # check if code is already applied
    if @order.promo_code_ids.empty? && @order.promo_code_ids.include?(@promo_code.id)
      redirect_to user_order_path(current_user, @order), notice: 'This code is already applied'
    end

    promo_code_ids = @order.promo_code_ids << @promo_code.id

    if @order.update(promo_code_ids:)
      # find categories the promo_code aplied is valid for
      valid_categories_ids = Category.joins(:promo_codes).where(promo_codes: { id: @promo_code }).map(&:id)
      
      promo_codes = PromoCode.where(id: @order.promo_code_ids)

      # ==================================================================
      # promo_code_ids => IDs of all codes applied to this order
      # promo_codes => all promo codes OBJECTS applied to this order
      # @promo_code => the code that was JUST APPLIED
      # valid_categories_ids => ids of all categories that this code is valid for
      # code_discount => the discount that will be applied to the order_item, changes for each one
       # ==================================================================

      code_discount = @promo_code.value || 0

      # find all products that will be discounted and update the code_discount on them and total price.
      @order_items.each do |order_item|
        product = Product.find(order_item.product_id)
        # check next item in cart if this doesn't have any category that is valid for this promo code
        next unless product.category_ids.intersect?(valid_categories_ids)
        # return if item in cart already has a bigger discount
        next unless order_item.code_discount < code_discount

        code_discount = promo_code.value if @promo_code.value > code_discount

        total_price = (product.price * order_item.quantity * (1 - (product.discount / 100)) * (1 - (code_discount / 100))).ceil(2) 
        order_item.update!(code_discount:, total_price:)
      end
    end
  end

  def remove_promo_code
    return unless params[:commit] == 'Remove Code'
    promo_code_ids = @order.promo_code_ids.filter { |id| id != @promo_code.id }

    if @order.update(promo_code_ids:)
      valid_categories_ids = Category.joins(:promo_codes).where(promo_codes: { id: @promo_code }).map(&:id)
      promo_codes = PromoCode.where(id: @order.promo_code_ids)

      # ==================================================================
      # promo_code_ids => IDs of all codes applied to this order
      # promo_codes => all promo codes OBJECTS applied to this order
      # valid_categories_ids => ids of all categories that this code is valid for
      # code_discount => the discount that will be applied to the order_item, changes for each one
      # ==================================================================
      
      # loop through all order items and update the code_discount and total_price
      
      @order_items.each do |order_item|
        product = Product.find(order_item.product_id)
        code_discount = code_discount(product, order_item, promo_codes)
        
        total_price = (product.price * order_item.quantity * (1 - (product.discount / 100)) * code_discount).ceil(2)

        order_item.update!( code_discount:, total_price: )
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

  def set_promo_code
    @promo_code = PromoCode.where(title: params[:order][:promo_code]).take
  end

  def check_promo_code
    unless PromoCode.exists?(title: params[:order][:promo_code])
      redirect_to user_order_path(current_user, @order), notice: "This code doen't exist or is not valid anymore"
    end
  end

  def code_discount(product, order_item, promo_codes)
    code_discount = 0
    
    promo_codes.each do |promo_code|
      # check if item in cart has any category that is valid for this promo code
      if promo_code.category_ids.intersect?(product.category_ids)
        code_discount = promo_code.value if code_discount < promo_code.value
      end
    end
    1 - (code_discount.to_f / 100).ceil(2)
  end

  # Only allow a list of trusted parameters through.
  def order_params
    params
      .require(:order)
      .permit(:status, :promo_code_ids)
      .with_defaults(status: 'Shopping Cart', promo_code_ids: [])
  end
end

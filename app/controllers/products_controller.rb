class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]
  before_action :set_brands, only: %i[new edit create]
  before_action :set_categories, only: %i[new edit create]
  before_action :set_product_categories, only: %i[show update]

  # GET /products or /products.json
  def index
    
    # session.clear

    # clear all session variables except for user_id
    if params[:clear_filters].present?
      session[:query] = nil
      session[:size_filters] = nil
      session[:color_filters] = nil
      session[:brand_filters] = nil
      session[:category_filters] = nil
      session[:min_price_filter] = nil
      session[:max_price_filter] = nil
    end

    # store query in session
    session[:query] = params[:query] if params[:query].present? && params[:query] != ''
    # store filters in session
    if params[:size_filter].present? 
      if session[:size_filters].nil?
        session[:size_filters] = params[:size_filter]
      elsif !session[:size_filters].include?(params[:size_filter])
        session[:size_filters] += " #{params[:size_filter]}"
      end
    end
    if params[:color_filter].present?
      if session[:color_filters].nil? || session[:color_filters].empty?
        session[:color_filters] = params[:color_filter].downcase
      elsif !session[:color_filters].include?(params[:color_filter].downcase)
        session[:color_filters] += " #{params[:color_filter].downcase}"
      end
    end
    if params[:brand_filter].present? 
      if session[:brand_filters].nil?
        session[:brand_filters] = params[:brand_filter].downcase
      elsif !session[:brand_filters].include?(params[:brand_filter].downcase)
        session[:brand_filters] += " #{params[:brand_filter].downcase}"
      end
    end
    if params[:category_filter].present? 
      if session[:category_filters].nil?
        session[:category_filters] = params[:category_filter].downcase
      elsif !session[:category_filters].include?(params[:category_filter].downcase)
        session[:category_filters] += " #{params[:category_filter].downcase}"
      end
    end
    session[:min_price_filter] = params[:min_price_filter] if params[:min_price_filter].present?
    session[:max_price_filter] = params[:max_price_filter] if params[:max_price_filter].present?

    if params[:query].present? && session[:query] != ''
      queries = session[:query].downcase.split # split query into array of words
      @products = []
      # add all results from database search to @products without duplicates
      queries.each do |query|
        @products |= Product.where('lower(name) LIKE ?', "%#{query}%")
        @products |= Product.where(size: query.to_f)
        @products |= Product.where('lower(color) LIKE ?', "%#{query}%")
        @products |= Product.where('lower(description) LIKE ?', "%#{query}%")
        @products |= Product.where('lower(gender) LIKE ?', "%#{query}%")
        @products |= Product.joins(:brand).where('lower(brands.name) LIKE ?', "%#{query}%")
        @products |= Product.joins(:category).where('lower(categories.name) LIKE ?', "%#{query}%")
      end
    else
      @products = Product.all
    end
    
    @products = remove_duplicates(@products)

    # ----------- Update filters before filter -----------
    # based on user clicking a button to remove a filter that was applied
    session[:size_filters] -= params[:remove_size_filter] if params[:remove_size_filter].present?
    session[:color_filters] -= params[:remove_color_filter] if params[:remove_color_filter].present?
    session[:brand_filters] -= params[:remove_brand_filter] if params[:remove_brand_filter].present?
    session[:category_filters] -= params[:remove_category_filter] if params[:remove_category_filter].present?
    session[:min_price_filter] = nil if params[:remove_min_price_filter].present?
    params[:max_price_filter] = nil if params[:remove_max_price_filter].present?

    puts "====================================================================="
    puts "session[:query] = #{session[:query]}"
    puts "session[:size_filters] = #{session[:size_filters]}"
    puts "session[:color_filters] = #{session[:color_filters]}"
    puts "session[:brand_filters] = #{session[:brand_filters]}"
    puts "session[:category_filters] = #{session[:category_filters]}"
    puts "session[:min_price_filter] = #{session[:min_price_filter]}"
    puts "session[:max_price_filter] = #{session[:max_price_filter]}"
    puts "====================================================================="

    # ------------------ Apply Filters ------------------
    if session[:size_filters].present? && session[:size_filters].length.positive?
      @products = filter_size(@products, session[:size_filters].split.map(&:to_f))
    end

    if session[:color_filters].present? && session[:color_filters].length.positive?
      @products = filter_color(@products, session[:color_filters].split)
    end
    if session[:brand_filters].present? && session[:brand_filters].length.positive?
      @products = filter_brand(@products, session[:brand_filters].split)
    end
    if session[:category_filters].present? && session[:category_filters].length.positive?
      @products = filter_category(@products, session[:category_filters].split)
    end
    if session[:min_price_filters].present? && session[:min_price_filters].length.positive?
      @products = filter_min_price(@products, session[:min_price_filters].split.map(&:to_f))
    end
    if session[:max_price_filter].present? && session[:max_price_filters].length.positive?
      @products = filter_max_price(@products, session[:max_price_filters].split.map(&:to_f))
    end

    if turbo_frame_request?
      render partial: 'products', locals: { products: @products }
    else
      render :index
    end
  end

  # GET /products/1 or /products/1.json
  def show; end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit; end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to product_url(@product), notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  def set_brands
    @brands = Brand.all
  end

  def set_categories
    @categories = Category.all
  end

  def filter_size(products, sizes)
    filtered = []
    products_by_size = Product.where(size: sizes)
    products.each do |product|
      filtered << product if products_by_size.include?(product)
    end
    filtered
  end

  def filter_color(products, colors)
    filtered = []
    products_by_color = Product.where(color: colors)
    products.each do |product|
      filtered << product if products_by_color.include?(product)
    end
    filtered
  end

  def filter_brand(products, brands)
    filtered = []
    brand_ids = Brand.where(name: brands).pluck(:id)
    products_by_brand = Product.where(brand_id: brand_ids)
    products.each do |product|
      filtered << product if products_by_brand.include?(product)
    end
    filtered
  end

  def filter_category(products, category_names)
    filtered = []
    category_ids = Category.where(name: category_names).pluck(:id)
    products.each do |product|
      filtered << product if (product.category_ids & category_ids).present?
    end
    filtered
  end

  def filter_min_price(products, min_price)
    filtered = []
    products_by_min_price = Product.where('price >= ?', min_price)
    products.each do |product|
      filtered << product if products_by_min_price.include?(product)
    end
    filtered
  end

  def filter_max_price(products, max_price)
    filtered = []
    products_by_max_price = Product.where('price <= ?', max_price)
    products.each do |product|
      filtered << product if products_by_max_price.include?(product)
    end
    filtered
  end

  # get all products without duplicates based on size
  def remove_duplicates(products)
    @products_no_repeat = []
    products.each do |product|
      name = product.name
      brand = product.brand.name
      color = product.color

      @products_no_repeat << product unless @products_no_repeat.any? do |p|
                                              p.name == name &&
                                              p.brand.name == brand &&
                                              p.color == color
                                            end
    end
    @products_no_repeat
  end

  def set_product_categories
    @product_categories = []
    @product.category_ids.each do |category_id|
      @product_categories << Category.find(category_id)
    end
    @product_categories
  end

  # Only allow a list of trusted parameters through.
  def product_params
    params
      .require(:product)
      .permit(:name, :price, :description, :size, :color, :gender,
              :brand_id, :discount, :quantity, images:
               [], category_ids: [])
      .with_defaults(discount: 0)
  end
end

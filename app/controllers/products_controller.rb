class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]
  before_action :set_brands, only: %i[new edit create]
  before_action :set_categories, only: %i[new edit create]
  before_action :set_product_categories, only: %i[show update]
  before_action :set_query, only: %i[index]

  # GET /products or /products.json
  def index
    if params[:query].present?
      @filters = params[:filters] || []
      @filters |= params[:query].downcase.split # add the query to the filters without duplicates

      @products = []
      # add all results from database search to @products without duplicates
      @filters.each do |filter|
        @products |= Product.where('lower(name) LIKE ?', "%#{filter}%")
        @products |= Product.where('lower(color) LIKE ?', "%#{filter}%")
        @products |= Product.where('lower(description) LIKE ?', "%#{filter}%")
        @products |= Product.where('lower(gender) LIKE ?', "%#{filter}%")
        @products |= Product.joins(:brand).where('lower(brands.name) LIKE ?', "%#{filter}%")
        @products |= Product.joins(:category).where('lower(categories.name) LIKE ?', "%#{filter}%")
      end
    else
      @products = Product.all
    end
    @products = remove_duplicates(@products)

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




  def set_query
    if params[:query].present?
      @query |= params[:query].downcase.split
    else
      @query= []
    end
  end





  # get all products without duplicates based on size
  def remove_duplicates(products)
    @products_no_repeat = []
    products.each do |product|
      name = product.name
      brand = product.brand.name
      description = product.description
      color = product.color

      @products_no_repeat << product unless @products_no_repeat.any? do |p|
                                              p.name == name &&
                                              p.brand.name == brand &&
                                              p.description == description &&
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

# rubocop:disable all
class ProductsController < ApplicationController
  include FilterProducts
  before_action :authenticate_user!, only: %i[new edit create update destroy]
  before_action :set_product, only: %i[show edit update]
  before_action :set_brands, only: %i[new edit create admin_products admin_archived]
  before_action :set_colors, only: %i[index new edit create admin_products admin_archived]
  before_action :set_sizes, only: %i[index show new edit create admin_products admin_archived]
  before_action :set_genders, only: %i[index new edit create admin_products admin_archived]
  before_action :set_collections, only: %i[index new edit create admin_products admin_archived]
  before_action :set_categories, only: %i[new edit create]
  before_action :set_product_categories, only: %i[show update]

  def admin_products
     @products = Product.where(archived: false).all.page(params[:page]).order(id: :asc)

    if turbo_frame_request?
      render partial: 'products', locals: { products: @products }
    else
      render :admin_products
    end
  end

  def admin_archived
    @products = Product.where(archived: true).all.page(params[:page]).order(id: :asc)

    if turbo_frame_request?
      render partial: 'products', locals: { products: @products }
    else
      render :admin_archived
    end
  end
  
  # GET /products or /products.json
  def index
    # when user clicks on a clear all filters button
    clear_filters()
    # when user clicks on a filter button
    save_filter_in_session()
    # when user clicks on a remove filter button
    update_filters_stored_in_session()

    # when user search for something in search bar
    @products = search_products()
    @products = apply_filters(@products)
    @products = remove_duplicates(@products)
    @products = sort_products(@products)

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
        # format.html { redirect_to admin_products_path(), notice: 'Product was successfully updated.' }
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

  def set_product
    @product = Product.find(params[:id])
  end

  def set_colors
    @colors = Color.all
  end

  def set_brands
    @brands = Brand.all
  end

  def set_sizes
    @sizes = Size.all
  end

  def set_genders
    @genders = Gender.all
  end

  def set_collections
    @collections = Collection.all
  end

  def set_categories
    @categories = Category.all
  end

  def set_product_categories
    @product_categories = []
    @product.category_ids.each do |category_id|
      @product_categories << Category.find(category_id)
    end
    @product_categories
  end

  def filter_size(products, sizes)
    filtered = []
    size_ids = Size.where(number: sizes).pluck(:id)
    products_by_size = Product.where(size_id: size_ids)
    products.each do |product|
      filtered << product if products_by_size.include?(product)
    end
    filtered
  end

  def filter_color(products, colors)
    filtered = []
    color_ids = Color.where(name: colors).pluck(:id)
    products_by_color = Product.where(color_id: color_ids)
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

  # Only allow a list of trusted parameters through.
  def product_params
    params
      .require(:product)
      .permit(:archived, :name, :price, :description,
              :brand_id, :color_id, :size_id, :gender_id, :collection_id, :archived, :discount, :quantity, :image1, :image2, :image3, :image4, :image5, :iconicImage, :collectionImage, category_ids: [])
      .with_defaults(discount: 0)
  end
end

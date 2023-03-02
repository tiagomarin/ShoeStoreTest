class PromoCodesController < ApplicationController
  before_action :set_promo_code, only: %i[show edit update destroy]
  before_action :set_categories, only: %i[new edit]
  before_action :set_brands, only: %i[new edit]

  def admin_promo_codes
    @promo_codes = PromoCode.all
  end

  # GET /promo_codes or /promo_codes.json
  def index
    @promo_codes = PromoCode.all
  end

  # GET /promo_codes/1 or /promo_codes/1.json
  def show; end

  # GET /promo_codes/new
  def new
    @promo_code = PromoCode.new
  end

  # GET /promo_codes/1/edit
  def edit; end

  # POST /promo_codes or /promo_codes.json
  def create
    @promo_code = PromoCode.new(promo_code_params)

    respond_to do |format|
      if @promo_code.save
        format.html { redirect_to admin_promo_codes_path, notice: 'Promo code was successfully created.' }
        format.json { render :show, status: :created, location: @promo_code }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @promo_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /promo_codes/1 or /promo_codes/1.json
  def update
    respond_to do |format|
      if @promo_code.update(promo_code_params)
        format.html { redirect_to promo_code_url(@promo_code), notice: 'Promo code was successfully updated.' }
        format.json { render :show, status: :ok, location: @promo_code }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @promo_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /promo_codes/1 or /promo_codes/1.json
  def destroy
    @promo_code.destroy

    respond_to do |format|
      format.html { redirect_to promo_codes_url, notice: 'Promo code was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_promo_code
    @promo_code = PromoCode.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def promo_code_params
    params.require(:promo_code).permit(:title, :value, category_ids: [], brand_ids: [])
  end

  # List all available categories
  def set_categories
    @categories = Category.all
  end

  def set_brands
    @brands = Brand.all
  end
end

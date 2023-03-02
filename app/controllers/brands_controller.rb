class BrandsController < ApplicationController
  before_action :authenticate_user!

  def admin_brands
    @brands = Brand.all
  end

  def new
    @brand = Brand.new
  end

  def create
    @brand = Brand.new(brand_params)

    respond_to do |format|
      if @brand.save
        format.html { redirect_to new_product_path, notice: 'Brand was successfully created.' }
        format.json { render :show, status: :created, location: @brand }
      else
        format.html { redirect_to new_product_path, notice: 'Brand already exist.' }
        format.json { render json: @brand.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def brand_params
    params.require(:brand).permit(:name)
  end
end

class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: %i[update]

  def admin_categories
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to admin_categories_path, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { redirect_to new_product_path, notice: 'Category already exist.' }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        # format.html { redirect_to category_url(@category), notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :show, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
    # , :promo_code_ids:[]
  end
end

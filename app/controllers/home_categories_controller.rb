class HomeCategoriesController < ApplicationController
  before_action :set_home_category, only: %i[ show edit update destroy ]

  def admin_home_category
    @home_category1 = HomeCategory.find(1)
    @home_category2 = HomeCategory.find(2)
    @home_category3 = HomeCategory.find(3)

    @categories = Category.all.order(id: :asc)
  end

  # GET /home_categories or /home_categories.json
  def index
    @home_categories = HomeCategory.all
  end

  # GET /home_categories/1 or /home_categories/1.json
  def show
  end

  # GET /home_categories/new
  def new
    @home_category = HomeCategory.new
  end

  # GET /home_categories/1/edit
  def edit
  end

  # POST /home_categories or /home_categories.json
  def create
    @home_category = HomeCategory.new(home_category_params)

    respond_to do |format|
      if @home_category.save
        format.html { redirect_to home_category_url(@home_category), notice: "Home category was successfully created." }
        format.json { render :show, status: :created, location: @home_category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @home_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /home_categories/1 or /home_categories/1.json
  def update
    respond_to do |format|
      if @home_category.update(home_category_params)
        format.html { redirect_to admin_category_home_path, notice: "Home category was successfully updated." }
        format.json { render :show, status: :ok, location: @home_category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @home_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /home_categories/1 or /home_categories/1.json
  def destroy
    @home_category.destroy

    respond_to do |format|
      format.html { redirect_to home_categories_url, notice: "Home category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_home_category
      @home_category = HomeCategory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def home_category_params
      params.require(:home_category).permit(:category_id)
    end
end

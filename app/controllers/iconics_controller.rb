class IconicsController < ApplicationController
  include FilterProducts
  before_action :set_iconic, only: %i[update]

  def admin_iconics
    @products = Product.all
    @products = remove_duplicates(@products)
    @iconics = Iconic.all
  end

  # PATCH/PUT /iconics/1 or /iconics/1.json
  def update
    product = Product.find(params[:iconic][:iconic])
    respond_to do |format|
      if @iconic.update!(product:)
        format.html { redirect_to iconic_url(@iconic), notice: 'Iconic was successfully updated.' }
        format.json { render :show, status: :ok, location: @iconic }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @iconic.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_iconic
    @iconic = Iconic.find(params[:id]).order(id: :asc)
  end
end

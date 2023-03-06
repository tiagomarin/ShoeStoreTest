class IconicsController < ApplicationController
  include FilterProducts
  before_action :set_iconic, only: %i[update]

  def admin_iconics
    @products = remove_duplicates(Product.all)
    @iconics = Iconic.all.order(id: :asc)
  end

  # PATCH/PUT /iconics/1 or /iconics/1.json
  def update
    respond_to do |format|
      if @iconic.update(iconic_params)
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
    @iconic = Iconic.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def iconic_params
    params.require(:iconic).permit(:product_id)
  end
end

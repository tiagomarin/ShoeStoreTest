class DecorationsController < ApplicationController
  before_action :set_decoration, only: %i[ show edit update destroy ]

  def admin_decorations
    @decorations = Decoration.all.order(id: :asc)
  end

  # PATCH/PUT /decorations/1 or /decorations/1.json
  def update
    respond_to do |format|
      if @decoration.update(decoration_params)
        format.html { redirect_to decoration_url(@decoration), notice: "Decoration was successfully updated." }
        format.json { render :show, status: :ok, location: @decoration }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @decoration.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_decoration
      @decoration = Decoration.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def decoration_params
      params.require(:decoration).permit(:name, :avatar)
    end
end

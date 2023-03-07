class HomeCollectionsController < ApplicationController
  before_action :set_home_collection, only: %i[show edit update destroy]

  def admin_home_collection
    @home_collection = HomeCollection.first
    @collections = Collection.all.order(id: :asc)
  end

  # PATCH/PUT /home_collections/1 or /home_collections/1.json
  def update
    respond_to do |format|
      if @home_collection.update(home_collection_params)
        format.html do
          redirect_to home_collection_url(@home_collection), notice: 'Home collection was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @home_collection }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @home_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_home_collection
    @home_collection = HomeCollection.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def home_collection_params
    params.require(:home_collection).permit(:collection_id)
  end
end

class FavoritesController < ApplicationController
  def index
    @favorites = current_user.favorites
  end

  def create
    @favorite = current_user.favorites.build(user_id: params[:user_id], product_id: params[:product_id])
    @favorite.save
    # if @favorite.save
    #   # redirect_back fallback_location: root_path, notice: 'Product favorited!'
    #   alert: 'Product favorited!'
    # else
    #   # redirect_back fallback_location: root_path, alert: 'Error favoriting product.'
    #   alert: 'Error favoriting product.'
    # end
  end

  def destroy
    @favorite = current_user.favorites.find_by(product_id: params[:id])
    @favorite.destroy
    # redirect_back fallback_location: root_path, notice: 'Product unfavorited!'
  end
end

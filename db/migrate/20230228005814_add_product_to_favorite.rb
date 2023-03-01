class AddProductToFavorite < ActiveRecord::Migration[7.0]
  def change
    add_reference :favorites, :product, null: false, foreign_key: true
  end
end

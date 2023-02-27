class AddProductToIconics < ActiveRecord::Migration[7.0]
  def change
    add_reference :iconics, :product, null: false, foreign_key: true
  end
end

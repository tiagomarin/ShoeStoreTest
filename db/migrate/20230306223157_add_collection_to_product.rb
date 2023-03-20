class AddCollectionToProduct < ActiveRecord::Migration[7.0]
  def change
    add_reference :products, :collection, null: false, foreign_key: true
  end
end

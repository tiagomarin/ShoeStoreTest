class AddCollectionToHomeCollections < ActiveRecord::Migration[7.0]
  def change
    add_reference :home_collections, :collection, null: false, foreign_key: true
  end
end

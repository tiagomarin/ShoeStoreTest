class CreateHomeCollections < ActiveRecord::Migration[7.0]
  def change
    create_table :home_collections do |t|

      t.timestamps
    end
  end
end

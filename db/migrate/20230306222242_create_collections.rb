class CreateCollections < ActiveRecord::Migration[7.0]
  def change
    create_table :collections do |t|
      t.string :name, default: "No Collection"

      t.timestamps
    end
  end
end

class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.boolean :archived, default: false
      t.string :name
      t.decimal :price
      t.string :description
      t.integer :discount
      t.integer :quantity

      t.timestamps
    end
  end
end

class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.string :description
      t.decimal :size
      t.string :color
      t.string :gender
      t.string :brand
      t.integer :discount
      t.string :category
      t.integer :quantity

      t.timestamps
    end
  end
end

class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.string :description
      t.decimal :size
      t.string :color
      t.string :gender
      t.integer :discount
      t.integer :quantity

      t.timestamps
    end
  end
end

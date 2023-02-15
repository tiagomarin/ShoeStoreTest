class CreateOrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
      t.integer :quantity
      t.float :code_discount, default: 0
      t.decimal :total_price
      t.timestamps
    end
  end
end

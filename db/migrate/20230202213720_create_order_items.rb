class CreateOrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
      t.integer "quantity"
      t.timestamps
    end
  end
end

class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :status
      t.datetime :date, default: "open"

      t.timestamps
    end
  end
end

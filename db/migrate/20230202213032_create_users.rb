class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :address, default: "empty"
      t.string :role, default: "customer"

      t.timestamps
    end
  end
end

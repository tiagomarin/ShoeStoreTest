class CreatePromoCodes < ActiveRecord::Migration[7.0]
  def change
    create_table :promo_codes do |t|
      t.string :title
      t.float :value

      t.timestamps
    end
  end
end

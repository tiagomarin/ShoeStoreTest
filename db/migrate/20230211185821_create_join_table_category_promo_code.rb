class CreateJoinTableCategoryPromoCode < ActiveRecord::Migration[7.0]
  def change
    create_join_table :categories, :promo_codes do |t|
      t.index [:category_id, :promo_code_id]
      t.index [:promo_code_id, :category_id]
    end
  end
end

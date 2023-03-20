class CreateJoinTableBrandPromoCode < ActiveRecord::Migration[7.0]
  def change
    create_join_table :brands, :promo_codes do |t|
      # t.index [:brand_id, :promo_code_id]
      # t.index [:promo_code_id, :brand_id]
    end
  end
end

class AddJoinTableOrderPromoCode < ActiveRecord::Migration[7.0]
  def change
    create_join_table :orders, :promo_codes do |t|
      # t.index [:order_id, :promo_code_id]
      # t.index [:promo_code_id, :order_id]
    end
  end
end

class CreateHomeCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :home_categories do |t|

      t.timestamps
    end
  end
end

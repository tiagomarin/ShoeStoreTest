class CreateDecorations < ActiveRecord::Migration[7.0]
  def change
    create_table :decorations do |t|
      t.string :name

      t.timestamps
    end
  end
end

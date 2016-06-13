class CreateLabels < ActiveRecord::Migration
  def change
    create_table :labels do |t|
      t.string :color, null: false
      t.integer :card_id, null: false



      t.timestamps null: false
    end
  end
end

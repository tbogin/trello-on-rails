class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :title, null: false
      t.text :description
      t.integer :board_id, null: false

      t.timestamps null: false
    end
  end
end

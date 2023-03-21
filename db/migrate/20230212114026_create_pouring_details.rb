class CreatePouringDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :pouring_details do |t|
      t.integer :recipe_id, null: false
      t.integer :start_at, null: false, default: 0
      t.integer :amount, null: false
      t.text :note

      t.timestamps
    end
  end
end

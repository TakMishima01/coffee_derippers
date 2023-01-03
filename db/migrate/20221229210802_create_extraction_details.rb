class CreateExtractionDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :extraction_details do |t|
      t.integer :recipe_id, null: false
      t.datetime :start_at, null:false
      t.datetime :end_at
      t.integer :pouring_amount
      t.text :note

      t.timestamps
    end
  end
end

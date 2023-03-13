class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.integer :production_area_id, null: false
      t.integer :user_id, null: false
      t.string :name, null: false
      t.string :coffee_beans_name, null: false
      t.integer :roast, null: false, default: 1
      t.integer :amount, null: false
      t.integer :grind, null: false, default: 2
      t.integer :temperature, null: false
      t.integer :total_pouring_amount
      t.integer :extraction_amount
      t.integer :total_extraction_time, null: false
      t.string :dripper, null: false
      t.string :paper, null: false
      t.text :point
      t.boolean :status, null: false, default: false



      t.timestamps
    end
  end
end

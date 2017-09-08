class CreateIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.float :cost
      t.string :unit
      t.float :cost_per_butter_gram
      t.string :butter_unit
      t.timestamps
    end
  end
end

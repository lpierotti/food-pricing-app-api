class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
    	t.string :name
    	t.string :yield
    	t.string :ingredients
    	t.float :price
    end
  end
end

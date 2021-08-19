class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.string :ingredients
      t.string :recommendations

      t.timestamps
    end
    add_index :recipes, :recommendations
  end
end

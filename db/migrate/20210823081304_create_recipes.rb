class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.string :ingredients
      t.integer :recommendations
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :recipes, :recommendations
  end
end

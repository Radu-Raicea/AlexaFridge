class CreateShoppingListItems < ActiveRecord::Migration[5.1]
  def change
    create_table :shopping_list_items do |t|
      t.references :ingredient, foreign_key: true

      t.timestamps
    end
  end
end

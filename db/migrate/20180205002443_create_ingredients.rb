class CreateIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.boolean :in_stock

      t.timestamps
    end
  end
end

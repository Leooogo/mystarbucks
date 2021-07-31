class CreateFavoriteDrinks < ActiveRecord::Migration[6.0]
  def change
    create_table :favorite_drinks do |t|
      t.integer :drink_id
      t.integer :user_id

      t.timestamps
    end
  end
end

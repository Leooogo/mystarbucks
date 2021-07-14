class AddMilkToDrinks < ActiveRecord::Migration[6.0]
  def change
    add_column :drinks, :milk, :string
  end
end

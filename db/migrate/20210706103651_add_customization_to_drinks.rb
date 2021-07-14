class AddCustomizationToDrinks < ActiveRecord::Migration[6.0]
  def change
    add_column :drinks, :size, :string
    add_column :drinks, :ice, :string
    add_column :drinks, :flavours, :string
    add_column :drinks, :shot, :string
    add_column :drinks, :toppings, :string
  end
end

class ChangePriceToFloatInMenus < ActiveRecord::Migration[7.0]
  def change
    change_column :menus, :price, :float
  end
end

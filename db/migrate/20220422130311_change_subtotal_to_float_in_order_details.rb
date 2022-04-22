class ChangeSubtotalToFloatInOrderDetails < ActiveRecord::Migration[7.0]
  def change
    change_column :order_details, :subtotal, :float
  end
end

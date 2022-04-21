class AddSubtotalToOrderDetails < ActiveRecord::Migration[7.0]
  def change
    add_column :order_details, :subtotal, :integer
  end
end

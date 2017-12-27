class AddColumnSaudaIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :sauda_id, :integer
  end
end

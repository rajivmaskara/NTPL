class AddColumnIsOrderTakenToSauda < ActiveRecord::Migration
  def change
    add_column :saudas, :is_order_taken, :boolean, default: false
  end
end

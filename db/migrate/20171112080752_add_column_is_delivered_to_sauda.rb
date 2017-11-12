class AddColumnIsDeliveredToSauda < ActiveRecord::Migration
  def change
    add_column :saudas, :is_delivered, :boolean, default: false
  end
end

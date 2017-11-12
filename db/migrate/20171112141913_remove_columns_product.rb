class RemoveColumnsProduct < ActiveRecord::Migration
  
  def self.up
  	remove_column :products, :is_available
  	remove_column :products, :stock_quantity
  end
  
end

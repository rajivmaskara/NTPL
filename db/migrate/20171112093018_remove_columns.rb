class RemoveColumns < ActiveRecord::Migration
  
  
  def self.up
  	remove_column :saudas, :category_id
  	remove_column :saudas, :rate
  	remove_column :saudas, :quantity
  end

end

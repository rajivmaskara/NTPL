class RemoveProductNameFromProduct < ActiveRecord::Migration
  def change
    remove_column :products, :product_name, :string
  end
end

class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :product_name
      t.string :size
      t.boolean :is_available
      t.integer :stock_quantity
      t.timestamps
    end
  end
end

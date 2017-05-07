class CreateOrderRates < ActiveRecord::Migration
  def change
    create_table :order_rates do |t|
      t.integer :order_id
      t.integer :category_id
      t.integer :rate
	  t.timestamps
    end
  end
end

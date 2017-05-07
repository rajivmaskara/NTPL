class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
	  t.string :customer_name
      t.integer :phone_no
      t.string :location
      t.timestamps
    end
  end
end

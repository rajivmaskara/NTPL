class CreateSaudas < ActiveRecord::Migration
  def change
    create_table :saudas do |t|
      t.string :sauda_number
      t.date :sauda_date
      t.integer :customer_id
      t.integer :category_id
      t.float :rate
      t.integer :quantity

      t.timestamps
    end
  end
end

class CreateSaudaLineItems < ActiveRecord::Migration
  def change
    create_table :sauda_line_items do |t|
      t.integer :category_id
      t.float :rate
      t.integer :quantity

      t.timestamps
    end
  end
end

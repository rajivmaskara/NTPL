class AddColumnSaudaIdToSaudaLineItems < ActiveRecord::Migration
  def change
    add_column :sauda_line_items, :sauda_id, :integer
  end
end

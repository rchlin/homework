class RemoveOrderIdFromOrder < ActiveRecord::Migration
  def up
    remove_column :orders, :order_id
  end

  def down
    add_column :orders, :order_id, :string
  end
end

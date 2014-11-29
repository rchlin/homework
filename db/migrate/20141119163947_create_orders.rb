class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :equipment_name
      t.string :equipment_num
      t.datetime :buy_date
      t.datetime :use_start_date
      t.datetime :use_end_date
      t.boolean :check_status
      t.integer :quantity
      t.float :price
      t.string :user_name
      t.string :order_id
      t.boolean :over_status

      t.timestamps
    end
  end
end

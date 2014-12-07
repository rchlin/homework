class AddForeignerToOrder < ActiveRecord::Migration
  def change
    change_table :orders do |t|
      t.foreign_key :users
      #t.foreign_key :equipment
    end
    #change_table :equipment do |t|
     # t.foreign_key :users
    #end
  end
end

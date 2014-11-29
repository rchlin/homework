class CreateEquipment < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
      t.string :name
      t.string :number
      t.string :belong_to_institution
      t.string :image_link
      t.datetime :able_start_time
      t.datetime :able_end_time
      t.text :detail
      t.float :price
      t.integer :count
      t.boolean :status
      t.string :owner

      t.timestamps
    end
  end
end

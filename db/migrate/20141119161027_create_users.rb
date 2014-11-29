class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.string :email
      t.string :phone
      t.string :institution
      t.float :money
      t.string :type

      t.timestamps
    end
  end
end

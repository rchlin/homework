class Order < ActiveRecord::Base
  belongs_to :user
  attr_accessible :buy_date, :check_status, :equipment_name, :equipment_num, :over_status, :price, :quantity, :use_end_date, :use_start_date, :user_name

end

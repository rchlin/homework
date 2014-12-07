class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :equipment
  attr_accessible :buy_date, :check_status, :equipment_name, :equipment_num, :over_status, :price, :quantity, :use_end_date, :use_start_date, :user_name
  attr_accessible :user_id, :equipment_id

  validates :user_id, :equipment_id, presence: true
end

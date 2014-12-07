class Equipment < ActiveRecord::Base
  belongs_to :user
  has_many :orders

  attr_accessible :able_end_time, :able_start_time, :belong_to_institution, :count, :detail, :name, :number, :status, :owner, :price, :user_id

  validates :user_id, presence: true
end

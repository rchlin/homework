class Equipment < ActiveRecord::Base
  attr_accessible :able_end_time, :able_start_time, :belong_to_institution, :count, :detail, :name, :number, :status, :owner, :price
end

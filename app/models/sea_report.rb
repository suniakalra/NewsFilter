class SeaReport < ActiveRecord::Base

  belongs_to :sea_port
  has_one :ship_particular
end

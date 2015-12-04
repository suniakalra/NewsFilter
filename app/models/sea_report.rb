class SeaReport < ActiveRecord::Base

  belongs_to :first_sea_report
  has_one :ship_particular
end

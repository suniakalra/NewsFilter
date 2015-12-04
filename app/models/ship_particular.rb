class ShipParticular < ActiveRecord::Base

  belongs_to :sea_report
  belongs_to :vessel
end

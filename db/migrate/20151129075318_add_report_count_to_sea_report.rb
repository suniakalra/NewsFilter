class AddReportCountToSeaReport < ActiveRecord::Migration
  def change
  	 add_column :sea_reports, :report_count, :integer
  end
end

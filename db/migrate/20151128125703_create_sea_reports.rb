class CreateSeaReports < ActiveRecord::Migration
  def change
    create_table :sea_reports do |t|
      t.boolean :is_closed, :default => false

      t.datetime :closed_time_in_smt
      t.datetime :closed_time_in_utc 

  	  t.integer :report_number, :integer
      t.integer :sea_port_id

      t.string :zone_time, :limit => 255, :default => "UTC" 
      t.decimal :report_interval
      t.timestamps null: false
    end
  end
end
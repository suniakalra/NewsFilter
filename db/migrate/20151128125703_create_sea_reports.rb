class CreateSeaReports < ActiveRecord::Migration
  def change
    create_table :sea_reports do |t|
      t.boolean :is_closed, :default => false

      t.string :closed_time_in_smt
      t.datetime :closed_time_in_utc 

      t.string :opened_time_in_smt

  	  t.integer :report_number, :integer
      t.integer :sea_port_id

      t.string :zone_time
      t.decimal :report_interval
      t.timestamps null: false
    end
  end
end
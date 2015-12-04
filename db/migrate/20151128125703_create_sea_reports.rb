class CreateSeaReports < ActiveRecord::Migration
  def change
    create_table :sea_reports do |t|
      t.boolean :is_closed, :default => false
      t.integer :first_sea_report_id
      t.timestamps null: false
    end
  end
end
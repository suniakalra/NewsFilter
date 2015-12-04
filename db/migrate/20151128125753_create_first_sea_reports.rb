class CreateFirstSeaReports < ActiveRecord::Migration
  def change
    create_table :first_sea_reports do |t|

      t.timestamps null: false
    end
  end
end

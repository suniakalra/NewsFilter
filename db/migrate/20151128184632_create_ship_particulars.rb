class CreateShipParticulars < ActiveRecord::Migration
  def change
    create_table :ship_particulars do |t|

      t.string :vessel_name
      t.integer :vessel_imo_no
      t.integer :vessel_id
      t.string :captain_name
      t.string :chief_engineer
      t.integer :sea_report_id
    end
  end
end

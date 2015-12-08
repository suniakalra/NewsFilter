class CreateSeaPorts < ActiveRecord::Migration
  def change
    create_table :sea_ports do |t|

      t.string :starting_port_name
      t.string :reached_port_name
      t.boolean :is_reached, :default => false
      t.string  :description, :default => nil

      t.string :vessel_name
      t.integer :vessel_imo_no
      t.integer :vessel_id
      t.string :captain_name
      t.string :chief_engineer

      t.string :zone_time, :limit => 255, :default => "UTC" 

      t.integer :total_reports, :default => nil
      t.timestamps null: false

    end
  end
end

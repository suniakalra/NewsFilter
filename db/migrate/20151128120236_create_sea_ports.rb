class CreateSeaPorts < ActiveRecord::Migration
  def change
    create_table :sea_ports do |t|

      t.integer :first_sea_report_id
      t.integer :starting_port_id
      t.integer :reached_port_id
      t.boolean :is_reached, :default => false
      t.timestamps null: false
    end
  end
end

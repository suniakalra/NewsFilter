class CreateSeaPorts < ActiveRecord::Migration
  def change
    create_table :sea_ports do |t|

      t.string :starting_port_name
      t.string :reached_port_name
      t.boolean :is_reached, :default => false
      t.string  :description, :default => nil
      t.timestamps null: false

    end
  end
end

class CreateVessels < ActiveRecord::Migration
  def change
    create_table :vessels do |t|

      t.timestamps null: false
    end
  end
end

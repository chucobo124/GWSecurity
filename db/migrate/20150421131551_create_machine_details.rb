class CreateMachineDetails < ActiveRecord::Migration
  def change
    create_table :machine_details do |t|
      t.string :name
      t.string :detail

      t.timestamps null: false
    end
  end
end

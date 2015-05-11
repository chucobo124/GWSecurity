class CreateMachineRoles < ActiveRecord::Migration
  def change
    create_table :machine_roles do |t|
      t.integer :machineId
      t.integer :userId
      t.datetime :machineAccessTime

      t.timestamps null: false
    end
  end
end

class AddColumnsToUsers < ActiveRecord::Migration
  def change
  	add_column :users,:permissionId,:integer, default: 4
  	add_column :users,:machineRoleId,:integer
  end
end

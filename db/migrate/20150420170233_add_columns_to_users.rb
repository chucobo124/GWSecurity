class AddColumnsToUsers < ActiveRecord::Migration
  def change
  	add_column :users,:permissionId,:integer
  	add_column :users,:machineRoleId,:integer
  end
end

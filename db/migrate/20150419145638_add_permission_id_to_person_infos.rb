class AddPermissionIdToPersonInfos < ActiveRecord::Migration
  def change
  	add_column :person_infos, :permissionId, :string
  end
end

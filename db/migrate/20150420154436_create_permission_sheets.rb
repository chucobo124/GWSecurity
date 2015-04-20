class CreatePermissionSheets < ActiveRecord::Migration
  def change
    create_table :permission_sheets do |t|
      t.string :cardId
      t.string :permissionType
      t.datetime :accessTime
      t.datetime :endTime
      t.integer :permissionAreaId
      t.integer :userId

      t.timestamps null: false
    end
  end
end

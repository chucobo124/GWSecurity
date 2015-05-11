class CreatePageManagePaths < ActiveRecord::Migration
  def change
    create_table :page_manage_paths do |t|
      t.string :pageName
      t.integer :permissionId
      t.boolean :allowPermission

      t.timestamps null: false
    end
  end
end

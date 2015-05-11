class CreateWorkShopSheets < ActiveRecord::Migration
  def change
    create_table :work_shop_sheets do |t|
      t.boolean :workShopAvailable
      t.integer :machineId
      t.integer :userId
      t.datetime :workShopAccessTime

      t.timestamps null: false
    end
  end
end

class CreatePersonInfos < ActiveRecord::Migration
  def change
    create_table :person_infos do |t|
      t.string :name
      t.integer :cardId
      t.datetime :accessTime
      t.datetime :endTime
      t.integer :machineId
      t.integer :userId

      t.timestamps null: false
    end
  end
end

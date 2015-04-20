class CreatePersonInfos < ActiveRecord::Migration
  def change
    create_table :person_infos do |t|
      t.string :name
      t.datetime :accessTime
      t.datetime :endTime
      t.integer :userId

      t.timestamps null: false
    end
  end
end

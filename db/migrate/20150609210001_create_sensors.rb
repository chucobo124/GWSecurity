class CreateSensors < ActiveRecord::Migration
  def change
    create_table :sensors do |t|
      t.string :name
      t.text :description
      t.string :api_key
      t.string :v1_name
      t.string :v1_unit
      t.string :v2_name
      t.string :v2_unit

      t.timestamps null: false
    end
  end
end

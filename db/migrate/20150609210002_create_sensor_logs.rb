class CreateSensorLogs < ActiveRecord::Migration
  def change
    create_table :sensor_logs do |t|
      t.belongs_to :sensor, index: true

      t.string :v1
      t.string :v2

      t.timestamps null: false
    end
  end
end

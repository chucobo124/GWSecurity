class Sensor < ActiveRecord::Base

  validates_presence_of :name, :api_key

  has_many :sensor_logs

end

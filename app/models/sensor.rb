class Sensor < ActiveRecord::Base

  validates_presence_of :name, :api_key

end

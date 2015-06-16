require 'test_helper'

class SensorLogTest < ActiveSupport::TestCase

  def setup
    @sensor = Sensor.new(
      :name => 'Main Power',
      :api_key => '1234567890123456',
      :v1_name => 'AC 110',
      :v1_unit => 'V',
      :v2_name => 'AC 220',
      :v2_unit => 'V'
      )
    @sensor.save

    @sensor_log = @sensor.sensor_logs.new
    @sensor_log.v1 = '111'
    @sensor_log.v2 = '222'
  end

  test "valid model" do
    assert @sensor_log.save
  end

end

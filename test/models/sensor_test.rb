require 'test_helper'

class SensorTest < ActiveSupport::TestCase

  def setup
    @sensor = Sensor.new(:id => 1, :name => 'Main Power', :api_key => '1234567890123456')
  end

  test "valid model" do
    assert @sensor.save
  end

  test "require name" do
    @sensor.name = ''
    assert_not @sensor.save
    @sensor.name = nil
    assert_not @sensor.save
  end

  test "require api_key" do
    @sensor.api_key = ''
    assert_not @sensor.save
    @sensor.api_key = nil
    assert_not @sensor.save
  end

end

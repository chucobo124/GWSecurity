require 'test_helper'

class SensorTest < ActiveSupport::TestCase

  def setup
    @sensor = Sensor.new(:name => 'Main Power', :api_key => ('X'*16))
  end

  test "valid model" do
    assert_equal 16, @sensor.api_key.length
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

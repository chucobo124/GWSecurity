module SensorsHelper

  def generate_api_key(size = 16)
    alphas = ('0'..'9').to_a + ('A'..'Z').to_a
    new_key = (1..size).map {alphas[Kernel.rand(36)]}.join

    # 用遞迴方式處理碰撞
    new_key = generate_api_key if Sensor.find_by_api_key(new_key)
    return new_key
  end

end

class SensorLogsController < ApplicationController

  before_action :authenticate_user!, :except => [:create]

  def index
    @sensor = Sensor.find(params[:sensor_id])
    @sensor_logs = @sensor.sensor_logs.order('id DESC').page params[:page]
  end

  def create
    @sensor = Sensor.find_by_api_key(sensor_log_params[:key])
    # redirect_to sensor_path(@sensor.id)
    # if (@sensor && sensor_log_params[:v1].present?)
    if @sensor
      # @sensor_log = SensorLog.new
      # @sensor_log.sensor_id = @sensor.id
      @sensor_log = @sensor.sensor_logs.new
      @sensor_log.v1 = sensor_log_params[:v1] if sensor_log_params[:v1].present?
      @sensor_log.v2 = sensor_log_params[:v2] if sensor_log_params[:v2].present?
      @sensor_log.save

      render :text => 'OK:' + @sensor_log.id.to_s
    else
      render :text => 'ERROR'
    end
  end

private

  def sensor_log_params
    params.permit(:key, :v1, :v2)
  end

end

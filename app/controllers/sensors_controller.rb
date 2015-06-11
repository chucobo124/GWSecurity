class SensorsController < ApplicationController

  include SensorsHelper

  def index
    @sensors = Sensor.all
  end

  def show
    @sensor = Sensor.find(params[:id])
  end

  def new
    @sensor = Sensor.new
  end

  def create
    @sensor = Sensor.create(sensor_params)
    @sensor.api_key = generate_api_key
    if @sensor.save
      redirect_to sensor_path(@sensor.id), notice: '新增 Sensor 資料成功'
    else
      render :new
    end
  end

  def edit
    @sensor = Sensor.find(params[:id])
  end

  def update
    @sensor = Sensor.find(params[:id])
    # @sensor.api_key = generate_api_key if @sensor.api_key.to_s == ""
    if @sensor.update(sensor_params)
      redirect_to sensor_path(@sensor.id), notice: '修改 Sensor 資料成功'
    else
      render :edit
    end
  end

  def destroy
    @sensor = Sensor.find(params[:id])
    @sensor.destroy
    redirect_to sensor_path, alert: 'Sensor 資料已刪除'
  end

private

  def sensor_params
    params.require(:sensor).permit(:name, :description, :v1_name, :v1_unit, :v2_name, :v2_unit)
  end

end

class AreasController < ApplicationController
  def cumulative
    @areas = set_areas
    @area = find_area(@areas)
  end

  def daily
    @areas = set_areas
    @area = find_area(@areas)
  end

  def average
    @areas = set_areas
    @area = find_area(@areas)
  end

  private

  def set_areas
    Area.from_json(utlas_json).sort_by(&:name)
  end

  def find_area(areas)
    areas.find { |area| area.code == area_code }
  end

  def area_code
    params.fetch(:area_code, 'E06000023')
  end

  def utlas_json
    DataSource.utlas_json
  end
end

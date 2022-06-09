require_relative 'instance_counter'
require_relative 'validation'

class Route
  include InstanceCounter
  include Validation

  attr_reader :stations, :route_number

  validate :route_number, :presence
  validate :route_number, :type

  def initialize(route_number, first_station, end_station)
    @route_number = route_number
    @stations = [first_station, end_station]
    validate!
  end

  def first_station
    @stations.first
  end

  def end_station
    @stations.last
  end

  def add_intermediate_station(intermediate_station)
    @stations.insert(stations.size - 1, intermediate_station)
  end

  def del_intermediate_station
    return unless station != @stations.first && station != @stations.last && station.trains.empty?
  end

  def show_all_station
    stations.each { |all_station| puts all_station.name }
  end

end

require_relative 'instance_counter'
require_relative 'manufacturer'
require_relative 'validation'

class Train
  include InstanceCounter
  include Manufacturer
  include Validation

  attr_reader :number, :type, :wagons, :route, :speed

  NUMBER_FORMAT = /^[A-Z|\d]{3}-*[A-Z|\d]{2}$/i

  validate :number, :presence
  validate :number, :format, NUMBER_FORMAT

  def initialize(number, type)
    @number = number
    @type = type
    @speed = 0
    @wagons = []
    @manufacturer = manufacturer
    validate!
  end

  def add_wagon(wagon)
    @wagons << wagon if wagon.type == type
  end

  def delete_wagon(wagon)
    @wagons.delete(wagon)
  end

  def previous_station
    return if route.nil? || route.stations.first == current_station

    route.stations[route.stations.index(current_station) - 1]
  end

  def current_station
    @current_station unless route.nil?
  end

  def next_station
    return if route.nil? || route.stations.last == current_station

    route.stations[route.stations.index(current_station) + 1]
  end

  def go_speed(speed)
    @speed += speed
  end

  def to_brake
    @speed = 0
  end

  def route_assignment(route)
    @route = route
    @current_station = route.stations.first
    current_station.add_trains(self)
  end

  def moving_next_station
    return if next_station.nil?

    current_station.go_train(self)
    next_station.add_trains(self)
    @current_station = next_station
  end

  def moving_previous_station
    return if previous_station.nil?

    current_station.go_train(self)
    next_station.add_trains(self)
    @current_station = previous_station
  end

  # передаем каждый вагон поезда в блок (через yield)
  def each_block_wagon(&block)
    @wagons.each(&block)
  end

end

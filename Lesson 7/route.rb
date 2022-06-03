require_relative 'instance_counter'
require_relative 'validator'

class Route
  include InstanceCounter
  include Validator
	attr_reader :stations, :route_number

	def initialize(route_number, first_station, end_station)
		@route_number = route_number
		@stations = [first_station, end_station]
	  validate!
	  register_instance
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

	def del_intermediate_station(intermediate_station)
		if station != @stations.first && station != @stations.last && station.trains.empty?
			@stations.delete(station)
		end
	end

	def show_all_station
		stations.each { |all_station| puts all_station.name }
	end

	def validate!
		raise ArgumentError, "Ошибка! Введите название маршрута!" if @stations.any?
	end

end
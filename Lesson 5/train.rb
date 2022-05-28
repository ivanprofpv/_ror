require_relative 'manufacturer'
require_relative 'instance_counter'

class Train

	include Manufacturer
	include InstanceCounter
	attr_reader :number, :type, :wagons, :route, :speed

	@@trains = []

	def initialize(number, type)
		@number = number
		@type = type
		@speed = 0
		@wagons = []
		@@trains << self
		@manufacturer = manufacturer
		@register_instance
	end

	def self.find(train_number)
		@@trains.each { |train| train.number == number }
	end

	def add_wagon(wagon)
		if wagon.type == type
			@wagons << wagon
		end
	end

	def delete_wagon(wagon)
		@wagons.delete(wagon)
	end

	def previous_station
		return if route.nil? || route.stations.first = current_station
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

	protected

	#я не стал ничего убирать в протектед или приват, так как в моем представлении все
	#данные методы могут использоваться в воображаемом интерфейсе оператора для управления станцией и все данные из этих методов нужны для отображения.
	#возможно позже я внесу сюда методы, но пока так.
end
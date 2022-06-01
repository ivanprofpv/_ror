require_relative 'manufacturer'
require_relative 'instance_counter'
require_relative 'validator'

class Train

	include Manufacturer
	include InstanceCounter
	include Validator
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
		validate!
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

	def validate!
		valid_num_train = /^[A-Z|\d]{3}-*[A-Z|\d]{2}$/i
		valid_type_train = /(cargo|passenger)$/i
		raise "Ошибка! Номер поезда должен быть типа 'DDR-33' или 'FGG-VV'. Введите номер поезда еще раз" unless @number =~ valid_num_train
		raise "Ошибка! Тип поезда введен неправильно!" unless @type =~ valid_type_train
	end
end
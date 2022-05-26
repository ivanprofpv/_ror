require_relative 'manufacturer'
require_relative 'instance_counter'

class Train

	include Manufacturer
	include InstanceCounter
	attr_reader :speed, :route, :train_number, :type

	@@trains = []

	def initialize(train_number)
		@train_number = train_number
		@type = type
		@speed = 0
		@wagons = []
		@@trains << self
		@manufacturer = manufacturer
		@register_instance
	end

	def self.find(train_number)
		@@trains.each { |train| train.train_number == train_number }
	end

	def add_wagon(wagon)
		if type = wagon.type && @speed.zero?
			@wagons << wagon
		else
			puts "Ошибка! Вагон не подходит по типу, либо поезд не остановлен!"
		end
	end

	def delete_wagon(wagon)
		if type = wagon.type && speed.zero?
			@wagons.delete(wagon)
		else
			puts "Ошибка! Вагон не подходит по типу, либо поезд не остановлен!"
		end 
	end

	def previous_station
		if waypoint >= 0
		route.stations[@waypoint - 1]
		end
	end

	def current_station
		route.stations[@waypoint]
	end

	def next_station
		route.stations[@waypoint + 1]
	end

	def go_speed(speed)
		@speed += speed
	end

	def to_brake
		@speed = 0
	end

	def route_assignment(route)
		@route = route
		@waypoint = 0
		route.first_station.add_trains(self)
	end

	def moving_next_station
		if next_station
			current_station.go_train(self)
			next_station.add_trains(self)
			@waypoint += 1
		end
	end

	def moving_previous_station
		if next_station
			current_station.go_train(self)
			next_station.add_trains(self)
			@waypoint -= 1
		end
	end

	protected

	#я не стал ничего убирать в протектед или приват, так как в моем представлении все
	#данные методы могут использоваться в воображаемом интерфейсе оператора для управления станцией и все данные из этих методов нужны для отображения.
	#возможно позже я внесу сюда методы, но пока так.
end
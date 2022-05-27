require_relative 'instance_counter'

class Station
	include InstanceCounter
	attr_reader :trains, :name

	@@stations = []

	def initialize(name)
	  @name = name
	  @trains = []
	  @@stations << self
	  @register_instance
	end

	def self.all
		@@stations
	end

	def add_trains(number)
	  @trains << numbers
	end

	def show_trains
	  @trains.each { |train| puts "Номер поезда #{train.number}, тип #{train.type}" }
	end

	def show_trains_type(type)
		trains.find_all { |train_all| train_all.type == type }
	end

	def go_train(number)
		@trains.delete(number)
	end
end
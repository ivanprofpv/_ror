require_relative 'instance_counter'

class Station
	include InstanceCounter
	attr_reader :trains, :name

	@@stations = []

	def initialize(name)
	  @name = name
	  @trains = []
	  @@stations << self
	  register_instance
	end

	def self.all
		@@stations
	end

	def add_trains(train_number)
	  @trains << train_numbers
	end

	def show_trains
	  @trains.each { |train_number| puts train_number }
	end

	def show_trains_type(type)
		@trains.each do |train|
			if train.type = type
			puts "Поезда по типу, которые на станции: #{type}"
			end
		end
	end

	def go_train(train_number)
		@trains.delete(train_number)
	end
end
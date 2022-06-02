require_relative 'instance_counter'
require_relative 'validator'

class Station
	include InstanceCounter
	include Validator
	attr_reader :trains, :name

	@@stations = []

	def initialize(name)
	  @name = name
	  @trains = []
	  validate!
	  @@stations << self
	  @register_instance
	end

	VALID_NAME_STATION = /^[А-Я0-9]{4-15}$/i

	def self.all
		@@stations
	end

	def add_trains(number)
	  @trains << number
	end

	def show_trains(number)
	  @trains.each { |train| puts "Номер поезда #{train.number}" }
	end

	def show_trains_type(type)
		trains.find_all { |train_all| train_all.type == type }
	end

	def go_train(number)
		@trains.delete(number)
	end

	def validate!
		raise ArgumentError, "Ошибка! Вы не ввели название. Введите название: " unless @name =~ /.+/
	end
end
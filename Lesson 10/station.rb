require_relative 'instance_counter'
require_relative 'validation'

class Station
  include InstanceCounter
  include Validation

  attr_reader :trains, :name

  validate :name, :presence

  def initialize(name)
    @name = name
    @trains = []
    validate!
  end

  def self.all
    @@stations
  end

  def add_trains(number)
    @trains << number
  end

  def show_trains(_number)
    @trains.each { |train| puts "Номер поезда #{train.number}" }
  end

  def show_trains_type(type)
    trains.find_all { |train_all| train_all.type == type }
  end

  def go_train(number)
    @trains.delete(number)
  end

  # передаем каждый поезд на станции в блок (через yield)
  def each_block_trains(&block)
    @trains.each(&block)
  end

end

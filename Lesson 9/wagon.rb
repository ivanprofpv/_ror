require_relative 'manufacturer'

class Wagon
  include Manufacturer
  attr_reader :type, :number

  def initialize(number, type, manufacturer, volume)
    @number = number
    @type = type
    @manufacturer = manufacturer
    @volume = volume
    @reserved_place = 0
  end

  # расчет количества свободных мест
  def free_place
    @volume - reserved_place
  end

  # меняем количество забронированных мест
  def reserved_place(count = 0)
    @reserved_place += count
  end
end
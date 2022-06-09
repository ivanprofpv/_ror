require_relative 'manufacturer'
require_relative 'acсessors'
require_relative 'validation'

class Wagon
  include Manufacturer
  extend Accessors
  include Validation

  attr_reader :type, :number

  attr_accessor_with_history :meth1, :meth2
  strong_attr_accessor :meth3, String

  validate :volume, :presence
  validate :volume, :type, Integer

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
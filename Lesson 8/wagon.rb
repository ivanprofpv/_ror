require_relative 'manufacturer'

class Wagon
  include Manufacturer
	attr_reader :type, :number, :reserved_seats

	def initialize(number, type, manufacturer, volume)
		@number = number
		@type = type
    @manufacturer = manufacturer
    @volume = volume
    @reserved_seats = 0
	end

#расчет количества свободных мест
	def available_seats
		@volume - reserved_seats
	end

#меняем количество забронированных мест
	def reserved_seats(count=0)
		@reserved_seats += count
	end

end


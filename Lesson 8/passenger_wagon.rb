require_relative 'wagon'

class PassengerWagon < Wagon

	def initialize(number, manufacturer, volume)
  	super(number, 'passenger', volume)
	end

	def reserved_seats
		raise "Мест для бронирования нет!" if available_seats <= 0
		super(0)
	end

end
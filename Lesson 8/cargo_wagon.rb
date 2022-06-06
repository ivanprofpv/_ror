class CargoWagon < Wagon

	def initialize(number, type, manufacturer, volume)
		super(number, 'cargo', volume)
	end

	def reserved_seats(count)
		raise "Мест для бронирования нет!" if available_seats - count < 0 
		super(count)
	end

end
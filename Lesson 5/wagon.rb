require_relative 'manufacturer'

class Wagon
  include Manufacturer
	attr_reader :type, :number

	def initialize(number, type, manufacturer)
		@number = number
		@type = type
    @manufacturer = manufacturer
	end
end
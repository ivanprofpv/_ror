require_relative 'manufacturer'

class Wagon
  include Manufacturer
	attr_reader :type

	def initialize(type, manufacturer)
		@type = type
	end

end
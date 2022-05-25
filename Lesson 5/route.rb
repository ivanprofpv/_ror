require_relative 'instance_counter'

class Route
  include InstanceCounter
	attr_reader :stations

	def initialize(first_station, end_station)
		@stations = [first_station, end_station]
		register_instance
	end

	def first_station
		stations.first
	end

	def end_station
		stations.last
	end

	def add_intermediate_station(intermediate_station)
		@intermediate_station.insert(-2, intermediate_station)
	end

	def del_intermediate_station(intermediate_station)
		deleted_station = stations.slice(1..-1)
		if deleted_station.include?(intermediate_station)
		@stations.delete(intermediate_station)
		end
	end

	def show_all_station
		stations.each { |all_station| puts all_station }
	end

end
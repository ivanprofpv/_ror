class Station

attr_reader :trains, :name

def initialize(name)
  @name = name
  @trains = []
end

def add_trains(train_number)
  @trains << train_numbers
end

def show_trains
  @trains.each { |train_number| puts train_number }
end

def show_trains_type(type)
	@trains.each do |train|
		if train.type = type
		puts "Поезда по типу, которые на станции: #{type}"
	end
end

def go_train(train_number)
	@trains.delete(train_number)
end

end


class Route

attr_reader :stations

def initialize(first_station, end_station)
	@stations = [first_station, end_station]
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


class Train

attr_reader :speed, :type, :route, :train_number, :num_wagon

def initialize(train_number, type, num_wagon)
	@train_number = train_number
	@type = type
	@num_wagon = num_wagon
	@speed = 0
end

def go_speed(speed)
	@speed += speed
end

def to_brake
	@speed = 0
end

def show_wagons
	puts num_wagon
end

def wagon_coupler
	if speed == 0
		num_wagon += 1
	else
		puts "Сначала остановите поезд!"
	end
end

def wagon_uncoupling
	if speed == 0
		num_wagon -= 1
	else
		puts "Сначала остановите поезд"
end

def route_assignment(route)
	@route = route
	@waypoint = 0
	route.first_station.add_trains(self)
end

def previous_station
	if waypoint >= 0
	route.stations[@waypoint - 1]
end

def current_station
	route.stations[@waypoint]
end

def next_station
	route.stations[@waypoint + 1]
end

def moving_next_station
	if next_station
		current_station.go_train(self)
		next_station.add_trains(self)
		@waypoint += 1
	end
end

def moving_previous_station
	if next_station
		current_station.go_train(self)
		next_station.add_trains(self)
		@waypoint -= 1
	end
end

end
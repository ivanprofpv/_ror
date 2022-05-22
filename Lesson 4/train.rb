class Train

attr_reader :speed, :route, :train_number, :type

def initialize(train_number, num_wagon)
	@train_number = train_number
	@type = type
	@speed = 0
	@wagons = []
end

def add_wagon(wagon)
	if type = wagon.type
		@wagons << wagon
end

def delete_wagon(wagon)
	@wagons.reject! { |wagon| wagon.type = type }
end

def show_wagons
	puts num_wagon
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

protected

#методы go_speed и to_brake нужны для использования и в других классах, 
#таких как пассажирский и грузовой поезда. Соответственно, 
#для них решил использовать protected.
#При этом, эти методы не нужны для интерфейса пользователя.
def go_speed(speed)
	@speed += speed
end

def to_brake
	@speed = 0
end

end
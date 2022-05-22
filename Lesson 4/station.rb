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
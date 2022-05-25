require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'wagon'

MAIN_MENU = [
{ index: 1, title: "Создать станцию", action: :create_station },
{ index: 2, title: "Создать поезд", action: :create_train },
{ index: 3, title: "Создать маршрут и управлять маршрутом", action: :create_route_and_manage },
{ index: 4, title: "Назначить маршрут поезду", action: :set_route_train },
{ index: 5, title: "Добавить вагон к поезду", action: :add_wagon_train },
{ index: 6, title: "Отцепить вагон от поезда", action: :delete_wagon_train },
{ index: 7, title: "Переместить поезд вперед или назад", action: :moving_next_previos_train },
{ index: 8, title: "Просмотреть список станций и список поездов на станции", action: :show_all_station_and_train }
].freeze

def create_station
	puts "Введите название Класса станции"
	name_class_station = gets.chomp

	puts "Введите название станции"
	name_station = gets.chomp

	name_class_station = Station.new(name_station)
	puts "Новая станция под названием #{name_station} спешно создана!"
end

def create_train
		puts "Введите название Класса поезда"
		name_class_train = gets.chomp
		puts "Введите название поезда"
		name_train = gets.chomp.to_sym
		puts "Введите тип поезда: 'cargo' или 'passenger'"
		type_train = gets.chomp.to_sym
    puts "'exit' - для выхода в главное меню"

		case type_train
		when :cargo 
			type_train = CargoTrain.new(name_train)
			puts "Грузовой поезд под названием #{name_train} успешно создан!"
		when :passenger
			type_train = Passenger.new(name_train)
			puts "Пассажирский поезд под названием #{name_train} успешно создан!"
		when :exit
      exit
    else
			puts "Ошибка! Введите 'cargo' или 'passenger'"
		end
	end

def create_route_and_manage
		puts "Введите 'new' для создания нового маршрута"
		puts "или введите 'manage' для управления станцией маршрута"
    puts "'exit' - для выхода в главное меню"
		user_choise_route = gets.chomp.to_sym

		case user_choise_route
		when :new
			puts "Введите название Класса маршрута"
			name_class_route = gets.chomp
			puts "Введите название первое станции отправления: "
			first_name_station = gets.chomp.to_sym
			puts "Введите название станции прибытия: "
			last_name_station = gets.chomp.to_sym

			name_class_route = Route.new(first_name_station, last_name_station)
			puts "Маршрут следования поезда создан. Маршрут: #{first_name_station} - #{last_name_station}"

		when :manage 
			puts "Введите 'add' для добавления станции в маршруте"
			puts "Введите 'delete' для удаления станции в маршруте"
      puts "'exit' - для выхода в главное меню"
			user_choise_route = gets.chomp.to_sym

    when :exit
      exit

			case user_choise_route
			when :add 
				puts "Введите название Класса станции в маршруте: "
				name_class_station = gets.chomp.to_sym
				puts "Введите название маршрута для добавления станции: "
				new_route = gets.chomp
				new_route.add_intermediate_station(name_class_station)

			when :delete 
				puts "Введите название класса станции в маршруте для удаления: "
				name_class_station = gets.chomp
				puts "Введите название маршрута (станции) в маршруте: "
				delete_route = gets.chomp
				delete_route.del_intermediate_station(name_class_station)

			else 
				puts "Ошибка! Введите 'add' или 'delete'"
			end
		end
end

def set_route_train
	puts "Введите название Класса маршрута поезда, который нужно назначить поезду: "
	name_class_train_route = gets.chomp
	puts "Введите название Класса поезда, которому необходимо установить маршрут: "
	name_class_train = gets.chomp
	name_class_train_route.route_assignment(name_class_train)
end

def add_wagon_train
	puts "Введите название Класса поезда, к которому нужно прицепить вагон: "
	name_class_train = gets.chomp
	puts "Введите название Класса вагона, который нужно прицепить к поезду: "
	name_class_wagon = gets.chomp
	name_class_train.add_wagon(name_class_wagon)
end

def delete_wagon_train
  puts "Введите название Класса поезда, от которого нужно отцепить вагон: "
  name_class_train = gets.chomp
  puts "Введите название Класса вагона, который нужно отцепить от поезда: "
  name_class_wagon = gets.chomp
  name_class_train.delete_wagon(name_class_wagon)
end

def moving_next_previos_train
  puts "В этом меню поезд можно отправить на 1 станцию вперед или назад. Выберите действие: "
  puts "'forward' для отправки вперед"
  puts "'back' для отправки назад"
  puts "'exit' - для выхода в главное меню"
  user_choise_route = gets.chomp.to_sym

  case user_choise_route
  when :forward
    puts "Введите название Класса поезда, который нужно отправить на 1 станцию вперед: "
    name_class_train = gets.chomp
    name_class_train.next_station

  when :back
    puts "ведите название Класса поезда, который нужно отправить на 1 станцию вперед: "
    name_class_train = gets.chomp
    name_class_train.previous_station

  when :exit
    exit

  else 
    puts "Ошибка! Введите 'add' или 'delete'"
  end
end

def show_all_station_and_train
  puts "Введите название Класса маршрута для просмотра списка станций: "
  name_class_route = gets.chomp
  name_class_route.show_all_station
  puts "Введите название Класса станции, для просмотра поездов на ней: "
  name_class_station = gets.chomp
  name_class_station.show_trains
end

loop do
  puts "Выберите действие: "
  MAIN_MENU.each { |item| puts "#{item[:index]}: #{item[:title]}" }
  choice = gets.chomp.to_i
  need_item = MAIN_MENU.find { |item| item[:index] == choice }
  send(need_item[:action])
  puts "Нажмите любую клавишу или введите 'exit' для выхода"
  break if gets.chomp.to_sym == :exit
end
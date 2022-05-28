require_relative 'main'

class MenuActions

def start
    loop do
      puts "Меню действий: 
      1. Создать станцию
      2. Создать поезд
      3. Создать маршрут
      4. Управление маршрутами (добавление и удаление промежуточной)
      5. Установить маршрут поезду
      6. Прицепить или отцепить вагон от поезда
      7. Отправить поезд вперед или назад
      8. Показать список станций и поездов
      9. Выход"
      puts "Введите команду цифрой: "

      choise = gets.chomp.to_i
      case choise
      when 1 then start_menu.create_station
      when 2 then start_menu.create_train
      when 3 then start_menu.create_route
      when 4 then start_menu.manage_route  
      when 5 then start_menu.set_route_for_train
      when 6 then start_menu.add_or_del_wagon
      when 7 then start_menu.moving_next_previous_train
      when 8 then start_menu.show_all_stations_and_trains
      when 9 then break
      end
    end
  end
end

start_menu = Main.new.start
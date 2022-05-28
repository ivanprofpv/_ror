--------------------------------------

  def select_train_from_list_message
    puts "Введите номер поезда из списка:"
    trains_list
  end

    def move_train_menu
    select_train_from_list_message
    number = gets.chomp
    train = select_train(number)
    routes_menu if train.route.nil?
    choices_list(
  ---------------------------------------

  def stations_list
  names = []
  @@stations.each do |station|
    names << station.name
  end
  blank_line
  puts names.join(", ")
end

def trains_list
  numbers = []
  @trains.each do |train|
    numbers << train.number
  end
  puts numbers.join(", ")
end
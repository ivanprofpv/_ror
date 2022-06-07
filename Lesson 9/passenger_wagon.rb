require_relative 'wagon'

class PassengerWagon < Wagon
  def initialize(number, _manufacturer, volume)
    super(number, 'passenger', volume)
  end

  def reserved_place
    raise 'Мест для бронирования нет!' if free_place <= 0

    super(0)
  end
end
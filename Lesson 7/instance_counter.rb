module InstanceCounter

  def self.include(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    attr_reader :instances
  end

  def current
    @current ||= []
  end

  module InstanceMethods

    protected
    def register_instance
      self.class.current << self
      self.class.send(:instances=, self.class.current.size) #send вызывает метод instances и показывает текущее значение
    end

  end

end
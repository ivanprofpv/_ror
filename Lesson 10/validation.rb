module Validation
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module ClassMethods
    def validations
      @validations ||= []
    end

    def validate(number, type_valid, other_parameter = nil)
      validation = { number: number, type_valid: type_valid, other_parameter: other_parameter }
      instance_variable_set(:@validations, validations.push(validation))
    end
  end

  module InstanceMethods
    def validate!
      self.class.validations.each { |i| verification(i) }
    end

    # rubocop:disable Metrics/CyclomaticComplexity
    def verification(validation)
      number, type_valid, other_parameter = validation.values
      value = instance_variable_get("@#{number}".to_sym)

      case type_valid
      when :presence
        raise ArgumentError, "Номер/название не может быть пустым! Введите снова: " if value.nil? || value.to_s.empty?
      when :format
        raise ArgumentError, "Номер/название не соответствует формату! Введите снова: " unless value =~ other_parameter
      when :type
        raise TypeError, "Неправильный тип! Введите снова: " unless value.is_a?(other_parameter)
      end
    end
    # rubocop:enable Metrics/CyclomaticComplexity

    def valid?
      validate!
      true
    rescue ArgumentError, TypeError
      false
    end
  end
end
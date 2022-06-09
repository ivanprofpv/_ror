module Accessors
  def attr_accessor_with_history(*names)
    names.each do |name| 
      var_name =    "@#{name}".to_sym
      var_history = "@#{name}_history".to_sym
      
      define_method("#{name}_history".to_sym) { instance_variable_get(var_history) }
      define_method(name) { instance_variable_get(var_name) }
      define_method("#{name}=".to_sym) do |value|
        instance_variable_set(var_name, value)
        instance_variable_set(var_history, (instance_variable_get(var_history) || []).push(value))
      end
    end
  end

  def strong_attr_accessor(name, type_class)
    var_name = "@#{name}.to_sym"
    define_method(name) { instance_variable_get(var_name) }
    define_method("#{name}=".to_sym) do |value|
      raise "Value does not apply to this #{type_class}" unless value.to_a?(type_class) 
      instance_variable_set(var_name, value)
    end
  end

end
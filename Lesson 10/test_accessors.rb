require_relative 'wagon'

c = Wagon.new(1, 'cargo', 'qwe', 50)

c.meth1 = 12
c.meth1 = 18
c.meth1 = 28
c.meth2 = 111
c.meth2 = -10

puts 'Check attr_accessor_with_history'
puts 'attr_accessor_with_history :meth1, :meth2'
puts "\n"
puts "Wagon.new(1, 'cargo', 'qwe', 50)"
puts "\n"
puts 'c.meth1 = 12'
puts 'c.meth1 = 18'
puts 'c.meth1 = 28'
puts 'c.meth2 = 111'
puts 'c.meth2 = -10'
puts "\n"
puts "meth1_history is #{c.meth1_history}"
puts "meth2_history is #{c.meth2_history}"
puts "\n"

c.meth2 = '12'

puts 'Check strong_attr_accessor'
puts 'strong_attr_accessor :meth2, String'
puts "\n"
puts "c.meth2 = '12' - ok"

begin
  c.meth2 = 12
rescue TypeError
  puts 'c.meth2 = 12 - threw exception'
end
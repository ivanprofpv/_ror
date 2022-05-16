puts "Введите ваше имя"
name = gets.chomp
puts "Введите ваш рост"
growth = gets.chomp

ideal = (growth.to_i - 110) * 1.15

if ideal.positive?
	puts "#{name}, ваш идеальный вес составляет #{ideal} кг!"
else
	puts "Ваш вес уже оптимальный"
end
puts "Введите коэффициент A"
a = gets.to_i

puts "Введите коэффициент B"
b = gets.to_i

puts "Введите коэффициент C"
c = gets.to_i

d = b**2 - (4*a*c)

if d > 0
	math = Math.sqrt(d)
	x1 = (-b + math) / (2*a)
	x2 = (-b - math) / (2*a)
	puts "Дискриминант #{d} и 2 корня: #{x1}, #{x2}"
elsif d == 0
	x = -b / (2*a)
	puts "Дискриминант #{d} и 1 корень #{x}"
else
	puts "Корней нет!"
end


puts "Введите число:"
day = gets.to_i

puts "Введите месяц, цифрой:"
months = gets.to_i

puts "Введите год:"
year = gets.to_i

def febr(year)
	if year % 4 == 0 && year % 100 != 0
		29
	elsif year % 100 == 0 && year % 400 == 0
		29
	else
		28
	end
end

days_in_year = [31, febr(year), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ]

calculated_days = days_in_year.first(months - 1).sum(day)

puts "Порядковый номер даты (дней): #{calculated_days}"
		



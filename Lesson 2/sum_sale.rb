puts "После того, как добавите товары, ведите 'stop' для завершения."

products = {}
  
loop do
  puts "Введите название товара: "
  name_prod = gets.chomp
  break if name_prod == "stop"
  puts "Введите цену за единицу (в цифрах, например, 10): "
  price = gets.to_i
  puts "Введите количество товара: "
  amount = gets.to_f
  products[name_prod] = { price: price, amount: amount }
end

p products

total_all = 0

products.each do |name_prod, total_price|
  total = total_price[:price] * total_price[:amount]
  total_all = total_all + total
  puts "Название товара: #{name_prod}, стоимость: #{total} рублей."
end

puts "Общая стоимость продуктов: #{total_all} рублей."
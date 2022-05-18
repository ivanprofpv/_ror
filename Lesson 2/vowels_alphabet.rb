alphabet = {}

count = 1

('A'..'Z').each do |value|
	if ['A','E','I','O','U'].include?(value)
	alphabet[value] = count
	count +=1
	end
end

p alphabet


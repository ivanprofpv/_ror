hash = { "jan" => 31, "feb" => 28, "mar" => 31, 
	"apr" => 30, "may" => 31, "june" => 30, 
	"july" => 31, "aug" => 31, "sept" => 30, 
	"oct" => 31, "nov" => 30, "dec" => 31, }
  
hash.each do |months, day|
	if day == 30
		puts "Месяцы, в которых 30 дней: #{months}"
	end
end

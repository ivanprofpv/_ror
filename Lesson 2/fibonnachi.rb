fibonnachi = [1]
fib = 1
while fib < 100
	fibonnachi << fib
	fib = fibonnachi[-1] + fibonnachi[-2]
end

p fibonnachi
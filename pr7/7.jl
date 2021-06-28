function euler(input)
    number = input
    result = number
	for i in 2:floor(Int, sqrt(number))
		if number % i == 0
        while number % i == 0
            number /= i
        end
        result -= result / i
        end
    end
	if number > 1 result -= result / number
    end
	return result
end

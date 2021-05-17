function isPrime(number)
    if (number % 2 == 0) return (number == 2)
    end
    dummy::Int = 3
    while dummy * dummy <= number && number % dummy != 0
        dummy += 2
    end
    return (dummy * dummy > number)
end
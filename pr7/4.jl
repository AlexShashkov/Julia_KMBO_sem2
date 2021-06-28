function checkIfPrime(n)
    if (n % 2 == 0) return (n == 2) end
    d::Int = 3
    while d * d <= n && n % d != 0
    d += 2 end
    
    return (d * d > n)
end

function gcd(x, y)
    if x < y
    x, y = y, x
    end
    if y == 0
        return x
    end
    return gcd(y, x%y)
end
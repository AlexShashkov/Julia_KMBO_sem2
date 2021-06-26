function gcd(x, y)
    if x < y
    x, y = y, x
    end
    if y == 0
        return x
    end
    return gcd(y, x%y)
end
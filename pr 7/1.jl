function pow(a, b)
    result = 1
    if b == 0
        return 1
    end
    while b > 0
        if b % 2 != 0
            result *= a
        end
        a *= a
        b = floor(Int, b // 2)
    end
    return result
end
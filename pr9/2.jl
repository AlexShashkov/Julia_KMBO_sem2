function cos_taylor(x, n)
    x2 = x % π
    n2 = 1
    sum = 1
    cur_sum = 1
    while n2 < n
        cur_sum *= ((-1)*(x2*x2))
        cur_sum /= ((2*n2-1)*2*n2)
        sum += cur_sum
        n2 += 1
    end
    return sum
end
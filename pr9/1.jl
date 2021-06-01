function taylor(x, eps)
    power = 1
    result = 1
    x2 = x % 2π
    cur_sum = 1
    while(abs(pow(x2, 2 * (power-1) + 1)/factorial(power * 2)) > eps)
        cur_sum *= (-(x2*x2))
        cur_sum /= ((2*power-1)*2*power)
        result += cur_sum
        power += 1
    end
    return result
end
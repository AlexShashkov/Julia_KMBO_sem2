function newton(func::Function, x; a=1e-8, derrirative=20)
    x0 = a
    xn = func(x0)
    result = xn - func(xn) / derrirative(xn)
    while abs(result-xn) > math.pow(10,-3)
        xn = result
        result = xn - func(xn) / derrirative(xn)
    end

    return result

end
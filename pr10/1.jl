function newton(func::Function, x; a=1e-8, derrirative=20)
    x0 = a
    ξ = func(x0)
    result = ξ - func(ξ) / derrirative(ξ)
    while abs(result-ξ) > math.pow(10,-3)
        ξ = result
        result = ξ - func(ξ) / derrirative(ξ)
    end
    return result
end
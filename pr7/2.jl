function fibonacci(n::Integer) 
    # через разностное уравнение
    γ = collect(1:n) 
    γ[1] = 0
    γ[2] = 1
    for i in 2:n
        γ[i] = γ[i-1] + γ[i-2]
    end
    return γ[n]
end
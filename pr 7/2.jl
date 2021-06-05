function fibonacci(n::Integer) # разностное уравнение
    collection = collect(1:n)
    collection[1] = 0
    collection[2] = 1
    for i in 2:n
        collection[i] = collection[i-1] + collection[i-2]
    end
    return collection[n]
end
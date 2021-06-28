function sort_by_count!(α, numbers) 
    counters = zeros(Int64, numbers+1)
    for i in α
        counters[α[i]] = counters[α[i]] + 1
    end
    index = 1
    i = 0
    for i in numbers
        k = 0
        while(k<counters[i])
            k = k + 1
            α[index] = counters[i]
            counters[i] = counters[i] - 1
            index = index + 1
        end
    end
    return α
end
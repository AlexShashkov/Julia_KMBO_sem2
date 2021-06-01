function sort_by_count!(a, n)
    counters = zeros(Int64, n+1)
    for i in a
        counters[a[i]] = counters[a[i]] + 1
    end
    index = 1
    j = 0
    for j in n
        k = 0
        while(k<counters[j])
            k = k + 1
            a[index] = counters[j]
            counters[j] = counters[j] - 1
            index = index + 1
        end
    end
    return a
end
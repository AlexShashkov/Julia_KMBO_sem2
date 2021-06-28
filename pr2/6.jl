insertsort!(α) = reduce(1:length(α)) do _, i 
    while i>1 && α[i-1] > α[i]
        α[i-1], α[i] = α[i], α[i-1]
        i -= 1
    end
    return α
end

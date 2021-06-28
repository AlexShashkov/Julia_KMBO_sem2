function insertsort!(α) 
    for ξ in 2:length(α)
        x = α[ξ]
        i = ξ
        while ((i > 1) && (α[i-1] > x))
            α[i] = α[i-1]
            i -= 1
        end
        α[i] = x
     end
     return α
end

function insertsort(α) 
    β = copy(α)
    return insertsort!(β)
end
function invariance(α::Integer, β::Integer) 
    for θ in 2:β
        if α*θ % β == 0
            return θ
        end
    end
    # else
    return nothing
end
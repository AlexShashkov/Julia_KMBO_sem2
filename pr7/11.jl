include("6.jl")

function nilpotents(α) 
    result = []
    counter = 2
    prod = 1

    for i in unique(factor(α))
        prod *= i
    end

    while counter < n
        if counter % prod == 0
            push!(result, counter)
        end
    end
    return result
end
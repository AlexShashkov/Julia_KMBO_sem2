function permutations(α::AbstractVector) 
    n = length(α)
    p=collect(1:n)

    function move_to_next()
        p = next_permute!(p)
        perm_a = α[p]
        return perm_a
    end

    return (move_to_next() for i in 1:factorial(n))
end

permutations(n::Integer) = permutations(collect(1:n))

function enhance_matrix!(G::Vector{Vector{Any}}) # only square matrix
    n = length(G)
    for i in 1:n
        for j in (i+1):n
            if G[i][j] === nothing
                G[i][j] = Inf
            end
        end
    end
    return G
end
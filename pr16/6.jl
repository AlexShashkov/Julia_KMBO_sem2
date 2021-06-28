function ford_bellman_prev(G::AbstractMatrix, s::Integer)
    Gₗ = size(G,1)
    prev = zeros(Int, Gₗ-1, Gₗ)
    C = repeat(G[s,:], Gₗ-1) 
    for k in 2:Gₗ-1, j in 2:Gₗ, i in 1:Gₗ
        if C[k,i] > C[k,i] + G[i,j]
            C[k,j] = C[k,i] + G[i,j]
            prev[k,j] = i
        end
    end
    return C, prev 
end

function optpath_ford_bellman(prev::Matrix, j::Integer, k_max = size(prev,1))
    path=Vector{Int}(undef, k_max)
    prevₗ = size(prev,1)
    while prev[prevₗ ,j]==0
        prevₗ -=1
    end
    prevₗ =min(prevₗ ,k_max)
    while j != 0 
        path[prevₗ ] = j
        j = prev[prevₗ ,j]
        prevₗ  -= 1
    end
    if prevₗ  > 0
        return nothing 
    end
    return path
end
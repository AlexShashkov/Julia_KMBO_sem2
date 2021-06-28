include("tools.jl")

function ford_bellman(G::AbstractMatrix, s::Integer)
    Gₗ = size(G,1)
    peresadki = G[s,:] 

    for _ in 1:Gₗ-2, i in 2:Gₗ
        peresadki[i] = min(peresadki[i], minimum(peresadki .+ G[:,i]))
    end
    return peresadki
end
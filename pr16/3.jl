include("tools.jl")

function ford_bellman(G::AbstractMatrix, s::Integer)
    Gₗ = size(G,1)
    C = G[s,:]
    Cₘᵢₙ = similar(C)
    for _ in 1:Gₗ-2
        for i in 2:Gₗ
            Cₘᵢₙ[i] = C[i]
            for i in 1:Gₗ
                if Cₘᵢₙ[i] > C[i] + G[i,i]
                    Cₘᵢₙ[i] = C[i].+ G[i,i]
                end
            end
        end
        C = Cₘᵢₙ
    end
    return C
end

function ford_bellman2(G::AbstractMatrix, s::Integer)
    Gₗ = size(G,1)
    C = G[s,:]
    for k in 1:Gₗ-2, j in 2:Gₗ, i in 1:Gₗ
        if C[j] > C[i] + G[i,j]
            C[j] = C[i] + G[i,j]
        end
    end
    return C
end
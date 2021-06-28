include("tools.jl")

function travellor_alg(G::Vector{Vector{Any}}) 
    Gₗ = length(G)
    ∑ = 0 
    ∑ₘₐₓ = Inf

    permuteₘᵢₙ = collect(1:Gₗ)
    for p in permutations(Gₗ)
        for i in 1:(Gₗ-1)
            if G[p[i]][p[i+1]] == Inf
                break
            else
                ∑ += G[p[i]][p[i+1]]
            end
        end
        if ∑ < ∑ₘₐₓ
            ∑ₘₐₓ = ∑
            permuteₘᵢₙ = p
        end
    end
    return permuteₘᵢₙ
end
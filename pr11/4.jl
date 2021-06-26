using Plots
include("1.jl")

function segments_intersection(α₁::VectorXY,β₁::VectorXY{T}, α₂::VectorXY{T}, β₂::VectorXY{T}) where T
    𝜴 = [β₁[2]-α₁[2]  α₁[1]-β₁[1]
         β₂[2]-α₂[2]  α₂[1]-β₂[1]]
    𝜸 = [α₁[2]*(α₁[1]-β₁[1])+α₁[1]*(β₁[2]-α₁[2])
         α₂[2]*(α₂[1]-β₂[1])+α₂[1]*(β₂[2]-α₂[2])]

    x, y = 𝜴\𝜸

    if isinner((x, y), α₁,β₁)==false || isinner((x, y), α₂,β₂)==false
        return nothing
    end

    return VectorXY{T}((x,y))
end

isinner(P,𝜴,B) = (𝜴.x <= P.x <= B.x || 𝜴.x >= P.x >= B.x) && (𝜴.y <= P.y <= B.y || 𝜴.y >= P.y >= B.y)
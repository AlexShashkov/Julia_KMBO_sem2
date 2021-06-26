include("structural.jl")

function toList(tree::Dict{T,Vector{T}}) where T
    result = Vector{Vector{T}}(undef, length(tree))
    for subroot in eachindex(result)
        result[subroot]=tree[subroot]
    end
    return result
end
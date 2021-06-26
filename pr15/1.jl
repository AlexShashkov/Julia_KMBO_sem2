include("structural.jl")

function toNested(tree::ConnectList{T}, root::T) where T
    result = T[]
    for subroot in tree[root]
        push!(result, convert(tree, subroot))
    end
    push!(result, root)
    return result
end

function toDictionary(tree::NestedVectors)
    T=typeof(tree[end])
    result = Dict{T,Vector{T}}()
    
    function recurs_trace(tree)
        result[tree[end]]=[]
        for subtree in tree[1:end-1] # - перебор всех поддеревьев
            push!(result[tree[end]], recurs_trace(subtree))
        end
        return tree[end] # - индекс конрня
    end

    recurs_trace(tree)
    return result
end
include("structural.jl")

function convertToStruct(tree::ConnectList{T}, root::T) where T
    result = Tree{T}(1)
    result.index = root
    for subroot in tree[root]
        push!(result.sub, convert(tree, subroot))
    end
    return result
end
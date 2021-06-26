include("structural.jl")

function height(tree::Tree) 
    # len of tree
    result = 0
    for subsequence in tree.subsequence
        result = max(result,height(subsequence))
    end
    return result+1
end

function toConnect(tree::Tree{T}) where T
    root = tree.index
    result = []
    if root == 1
        h = height(tree)
        for _ in 1:h
            push!(result, [])
        end
    end

    for subsequence in tree.subsequence
        if subsequence == []
        else
            for sub1 in subsequence.subsequence
                push!(result[subsequence.index], sub1.index)
            end
            toConnect(subsequence)
        end
    end
    return result
end

include("structural.jl")

function heightOfTree(tree::Tree)
    res=0
    for sub in tree.sub
        res = max(res,height(sub))
    end
    return res+1
end

function vernumberOfTree(tree::Tree)
    ν=1 
    for sub in tree.sub
        ν += vernumberOfTree(sub)
    end
    return ν
end

function leavesnumberOfTree(tree::Tree)
    if isempty(tree.sum)
        return 1
    end
    ν=0
    for sub in tree.sub
        ν += leavesnumberOfTree(sub)
    end
    return ν
end

function maxvalenceOfTree(tree::Tree)
    p=length(tree.sub)
    for _ in tree.sub
        p = max(p, maxvalenceOfTree(sub))
    end
    return p
end

function sumpathnumverOfTree(tree::Tree)
    ν=1
    ∑=0
    for sub in tree.sub
        s, n = sumpathnumverOfTree(sub)
        ∑ += s
        ν += n
    end
    return ∑, ν
end

function meanpathOfTree(tree::Tree)
    function sumpathnumverOfTree()
        ν=1
        ∑=0 
        for sub in tree.sub
            s, n = sumpathnumverOfTree(sub)
            ∑ += s
            ν += n
        end
        return ∑, ν
    end

    ∑, ν = sumpathnumverOfTree()
    return ∑/ν
end

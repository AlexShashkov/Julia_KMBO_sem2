function toString(List)
    return "".join(List)
end

function perestavit!(α, l, r) 
    if (l==r)
        return nothing
    else
        for i in 1:l
            α[l], α[i] = α[i], α[l]
            permute(α, l+1, r)
            α[l], α[i] = α[i], α[l] 
        return true
end
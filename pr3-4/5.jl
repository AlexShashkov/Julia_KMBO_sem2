function slice(A::Vector{T},p::Vector{Int})::Vector{T} where T
    res = []
    i = 1
    scope = Int(length(p)//2)
    while i <= scope
        append!(res, A[ p[i*2-1] : p[i*2] ])
        i+=1
    end
    return res
end
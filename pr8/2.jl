include("1.jl")
function mergesortUser!(α) 
    if length(α) == 1 return α end

    res1 = mergesortUser!(α[begin:end/2]) 
    res2 = mergesortUser!(α[end/2+1:end])
    return merge(res1, res2)
end
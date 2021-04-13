include("3.jl")

function sortkey!(a, key_values)
    ind = bubbleperm!(key_values)
    return a[ind]
end
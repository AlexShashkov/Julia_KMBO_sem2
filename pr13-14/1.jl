abstract type AbstrCombin
end

Base.iterate(obj::AbstrCombin) = (get(obj), nothing)
function Base.iterate(obj::AbstrCombin)
    if next!(obj) == false
        return nothing
    else
        return (get(obj), nothing)
    end
end

Base.get(obj::AbstrCombin) = obj.value
struct RepPlacement{N,K} <: AbstrCombin
    value::Vector{Int}
end

RepPlacement{N,K}() where {N, K} = RepPlacement{N,K}(ones(Int, K))

function next!(placement::RepPlacement{N,K}) where {N, K}
    c = get(placement)
    i = findlast(item->item < N, c)
    if isnothing(i)
        return false
    end
    c[i] += 1
    c[i+1:end] .= 1
    return true
end

struct RepPlacement{K} <: AbstrCombin
    value::Vector{Int}
    set::Vector
end

####################################################################################

RepPlacement{K}(n::Integer) where K = RepPlacement{K}(ones(Int, K),collect(1:n))
RepPlacement{K}(set::Set) where K = RepPlacement{K}(ones(Int, K),collect(set))

Base.get(placement::RepPlacement) = placement.set(placement.value)

####################################################################################

function next!(placement::RepPlacement)
    c = placement.value
    n = length(placement.set)
    i = findlast(item->item < n, c)
    if isnothing(i)
        return false
    end
    c[i] += 1
    c[i+1:end] .= 1
    return true
end
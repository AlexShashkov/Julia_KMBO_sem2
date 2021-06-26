function quotie(a::AbstractVector{T},b::AbstractVector{T}) where {T <: Union{Rational, AbstractFloat}}
    vec1 = copy(a)
    vec2 = copy(b)
    if length(vec1) < length(vec2) || (length(vec1) == length(vec2) && vec1[1] < vec2[1])
        vec1, vec2=vec2, vec1
    end
    q = []
    r = []
    i = 1
    while true
        for j in i:i+length(b)
            append!(q, vec1[j]//vec2[j])
            vec1[j] -= (vec1[j]//vec2[j])
            if j == length(a)
                break
            end
        end
        i += 1
    end
    r = vec1
    arr = [q,r]
    return arr
end

function /(p::Polynom, q::Polynom)
    return (quotie(p, q))[1]
end
function %(p::Polynom, q::Polynom)
    return (quotie(p, q))[2]
end
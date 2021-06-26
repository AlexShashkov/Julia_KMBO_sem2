function getArgumentMax(func::Function, a::AbstractVector)
    imax = firstindex(a)
    for i in firstindex(a)+1:lastindex(a)
        if func(a[i])>func(a[imax])
            imax = i
        end
    end
    return imax
end

function convert(A)
    B = copy(A)
    for k in firstindex(B,1):lastindex(B,1)
        imax = getArgumentMax(abs, @view B[k:end,k])
        colon_to_zeros!(B,k,imax)
    end
end

function det(A)
    convert(A)
    det = 1
    for i in 1:length(A)
        det *= A[i]
    end
    return det
end

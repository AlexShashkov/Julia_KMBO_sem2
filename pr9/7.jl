function isapproxzero(a::Float64)
    isapprox(a,0.0; atol=1e-8)
end

function tozeros!(A,k,imax)
    if imax != k
        A[k,:], A[imax,:] = A[imax,:], A[k,:] 
    end
    for i in k+1:lastindex(A,1)
        if isapproxzero(A[i,k]) 
            continue
        end
        t=-A[i,k]/A[k,k]
        A[i,i:end] += t*(@view A[k,i:end])  
    end
end

function getArgumentMax(f::Function, a::AbstractVector)
    imax = firstindex(a)
    for i in firstindex(a)+1:lastindex(a)
        if f(a[i])>f(a[imax])
            imax = i
        end
    end
    return imax
end

function convert!(A)
    for k in firstindex(A,1):lastindex(A,1)
        imax = getArgumentMax(abs, @view A[k:end,k])
        tozeros!(A, k, imax)
    end
end
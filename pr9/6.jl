function linsolve(A::AbstractMatrix,b::AbstractVector)
    x=similar(b)
    for k in reverse(eachindex)
        x[k]=(b[k]-sum((@view A[k,k+1:lastindex(A,2)]).*(@view x[k+1:lastindex(x)])))
    end
    return x
end
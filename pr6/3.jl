function  partsort_b(A,b)
    n = length(A)
    l = 1
    i = n
    
    while l != i
        if A[l] <= b
            A[l],A[l+1] = A[l+1],A[l]
            l += 1
        end

        if A[i] > b 
            A[i],A[i-1] = A[i-1],A[i]
            i -= 1
        end
    end 

    return A
end
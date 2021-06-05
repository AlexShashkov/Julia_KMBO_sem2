function partsort_1(A,b)
    j = 1
    A1 = collect(1:length(A))
    t = 1
    A2 = collect(1:length(A))
    r = 1
    A3 = collect(1:length(A)) 

    for i in 1:length(A)
        if b > A[i]
            A1[j] = A[i]
            j += 1
        elseif b == A[i]
            A2[t] = A[i]
            t += 1
        else
            A3[r] = A[i]
            r += 1
        end
    end

    ret = merge(A1,A2)
    ret = merge(ret,A3)

    return ret
end

function  partsort_2(A,b)
    n = length(A)
    l = 0
    i = 1
    j = n
    for i in 1:length(A) 
        if A[i] < b
            l += 1
    end

    while i != j
        if A[i] == b
            A[i],A[i+1] = A[i+1],A[i]
            i += 1
        end

        if A[j] > b 
            A[j],A[j-1] = A[j-1],A[j]
            j -= 1
        end
    end 

    return A
end
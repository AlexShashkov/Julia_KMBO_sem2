function cntsort_scope!(α, n::Int, m::Int) 
    ln = m-n+1
    C = zeros(Int64, ln)
    num = 1
    inx = 1

    for x in α
        C[x-n+1] += 1
    end
    
    while(num <= ln)
        while(C[num]>0)
            C[num] -= 1
            α[inx] = num+n-1
            inx += 1
        end
        num += 1
    end
    return α
end
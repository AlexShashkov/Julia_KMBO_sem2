function findallmax(A)
    max = A[firstindex(A)]
    max_nums = [] 
        for item in (firstindex(A):lastindex(A))
            if A[item] > max
                max = A[item]
                max_nums = [] 
            end
            if A[item] == max
                append!(max_nums, i)
            end
        end
        return max_nums
    end
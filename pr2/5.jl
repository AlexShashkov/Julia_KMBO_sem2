function count_sort_vector!(A, B)
    A = [3,2,5,7,5,3,6,8]
    B = [2,3,5,6,7,8]
    scope = B[length(B)] - B[1] + 1
    C = zeros(Int64, scope)
    for x in A
        C[x - B[1] + 1] += 1
    end
    index = 1
    number = 1
    while(number<=scope)
        while(C[number]>0)
            C[number] -= 1
            A[index] = number+B[1]-1
            index += 1
        end
        number += 1
    end
    return A
end
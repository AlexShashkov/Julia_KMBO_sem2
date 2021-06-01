function SimpleCountingSort(A)
    scope = length(A) + 1
    C = zeros(Int64, scope)
    for x in A
        C[x] += 1
    end
    index = 1
    number = 1
    while(number<scope)
        while(C[number]>0)
            C[number] -= 1
            A[index] = number
            index += 1
        end
        number += 1
    end
    return A
end
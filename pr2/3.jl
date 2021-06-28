function simpleCntrSort(α) 
    arr = zeros(Int64, length(α) + 1)
    for x in α
        arr[x] += 1
    end
    indx = 1
    number = 1
    while(number < (length(α) + 1))
        while(arr[number]>0)
            arr[number] -= 1
            α[indx] = number
            indx += 1
        end
        number += 1
    end
    return α
end
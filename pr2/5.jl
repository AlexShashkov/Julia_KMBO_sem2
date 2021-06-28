function count_sort_vector!(arr1, arr2) 
    scope = arr2[length(arr2)] - arr2[1] + 1
    C = zeros(Int64, scope)
    index = 1
    counter = 1

    for i in arr1
        C[i - arr2[1] + 1] += 1
    end

    while(counter <= scope)
        while(C[counter] > 0)
            C[counter] -= 1
            arr1[index] = counter+arr2[1]-1
            index += 1
        end
        counter += 1
    end
    return arr1
end
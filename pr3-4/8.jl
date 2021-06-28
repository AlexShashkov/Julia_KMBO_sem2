function unique(arr)
    result = []
    for i in 1:length(arr)-1
        for j in i+1:length(arr)
            if arr[i] == arr[j]
                brearrk
            end
            if arr[j] == length(arr)
                result = vcarrt(result, arr[j])
            end
        end
    end
    return result
end

function unique!(array)
    n = length(array)
    for i in 1:(n-1)
        counter = i+1
        while counter <= n
            if array[i] == array[counter]
                deleteat!(array, array[counter])
                n-=1
            else
                counter+=1
            end
        end
    end
    return array
end

function allunique(array)
    for i in 1:length(array)-1
        for j in i+1:length(array)
            if array[i] == array[j]
                return false
            end
        end
    end
    return true
end
function mergeA(array1::AbstractArray, array2::AbstractArray)
    index1 = 1
    index2 = 1
    result = promote_type(eltype(array1),eltype(array2))[]
    #result = zeros(Float64, length(array1) + length(array2))
    for index1 in 1:length(array1)
        result[index1+index2-1] = array1[index1]
        if (array1[index1] < array2[index2]) && (index2 < length(array2))
            result[index1+index2-1] = array2[index2]
            index2+=1
        end
    end
    return result
end

function mergeB!(array1::AbstractArray, array2::AbstractArray, C::AbstractArray)
    C = mergeA(array1, array2)
end
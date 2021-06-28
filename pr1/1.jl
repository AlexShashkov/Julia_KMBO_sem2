function rev!(array)
    n = length(array)
    array = array[n:-1:1]
end

function rev(array)
    return rev!(copy(array))
end

function rev!(matrix, dim)
    for i ∈ 1:dim
        matrix[i, :] = rev!(matrix[i, :])
    end
end

function rev(matrix, dim)
    return rev!(copy(matrix), dim)
end
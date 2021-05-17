function transposeUser(array)
    n = length(array)
    result = copy(array)
    for i in (1:n)
        for j in (1:n)
            result[i][j], result[j][i] = result[j][i], result[i][j]
        end
    end
    return result
end
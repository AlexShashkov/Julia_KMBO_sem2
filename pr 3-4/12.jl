function transposeEnchanched(array)
    n = length(array)
    for i in (1:n)
        for j in (1:n)
            array[i][j], array[j][i] = array[j][i], array[i][j]
        end
    end
    return array
end